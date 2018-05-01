class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def index
    @orders = Order.where(user: current_user)

    @payment_pending = Order.where(status: "pending_card")
    @orders_pending = Order.where(status: "pending_acceptance")
    @orders_accepted = Order.where(status: "accepted")
    @orders_refused = Order.where(status: "refused")
    @orders_cancelled = Order.where(status: "cancelled")

    @owner_orders = Order.joins(:product).where(product: { user_id: current_user.id })
  end

  def owner
    @orders = Order.where(user: current_user)
    @owner_orders = Order.joins(:product).where(products: { user_id: current_user.id })
    authorize @orders
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.end_date.present? && @order.start_date.present?

        @number_of_days = Date.parse("#{@order.end_date}") - Date.parse("#{@order.start_date}")
        @order.amount_cents = @product.price_cents * @number_of_days

    end

    if @order.save
      respond_to do |format|
        format.html { redirect_to order_path(@order) }
        format.js { render :js => "window.location.href='"+order_path(@order)+"'"} # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'products/show' }
        format.js  # <-- idem
      end
    end

    authorize @order
  end



  def payment
  end

  def show
    @order = Order.find(params[:id])
    @owner = @order.product.user.first_name
    authorize @order

    if current_user == @order.user && @order.status == "pending_card"
      render 'show_renter'
    elsif current_user == @order.user && @order.status == "pending_acceptance"
      render 'show_renter_pending_acceptance'
    elsif current_user == @order.user && @order.status == "accepted"
      render 'show_renter_accepted'
    elsif current_user == @order.user && @order.status == "refused"
      render 'show_renter_refuse'
    elsif current_user == @order.product.user && @order.status == "pending_card"
      render 'show_owner'
    elsif current_user == @order.product.user && @order.status == "pending_acceptance"
      render'show_owner_pending_acceptance'
    elsif current_user == @order.product.user && @order.status == "accepted"
      render 'show_owner_accepted'
    elsif current_user == @order.product.user && @order.status == "refused"
      render 'show_owner_refused'
    end
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    if order_params[:status] == "Accepted"
      charge = Stripe::Charge.create(
      customer:     current_user.stripe_customer_id,
      amount:       @order.amount_cents,
      description:  "Payment for order #{@order.id}",
      currency:     @order.amount.currency
      )
      @order.status = "accepted"
    elsif order_params[:status] == "Refused"
      @order.status = "refused"
    elsif order_params[:status] == "pending_acceptance"
      @order.status = "pending_acceptance"
      while current_user.stripe_customer_id.nil?
        customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
        )

        @stripe_customer_id = customer.id
        current_user.stripe_customer_id = @stripe_customer_id
        current_user.save
      end
    end
    @order.save
    if params[:order][:redirect_path] == "index"
      redirect_to owner_orders_path
    elsif params[:order][:redirect_path] == "index_renter"
      redirect_to orders_path
    elsif params[:order][:redirect_path] == "show"
      redirect_to order_path(@order)
    end
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :product_id, :user, :status)
  end

  def set_product
    @product = Product.find(order_params[:product_id])
  end

  def set_order
    @order = current_user.orders.where(status: 'pending_card').find(params[:order_id])
  end
end
