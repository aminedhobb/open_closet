class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]

  def index
    @orders = Order.where(user: current_user)
    # if current_user == @orders.product.user
    #   render 'index_owner'
    # else
    #   render 'index_renter'
    # end
    @orders_pending = Order.where(status: "pending_card")
    @orders_accepted = Order.where(status: "accepted")
    @orders_refused = Order.where(status: "refused")
    @orders_cancelled = Order.where(status: "cancelled")
    # authorize @order
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
    @number_of_days = Date.parse("#{@order.end_date}") - Date.parse("#{@order.start_date}")
    @order.amount_cents = @product.price_cents * @number_of_days
    @order.save
    redirect_to order_path(@order)
    authorize @order
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
    #   current_user == @order.user && @order.status == "pending_acceptance"
    # elsif
    #   current_user == @order.user
  end

  def update
    @order = Order.find(params[:id])
    if order_params[:status] == "Accepted"
      @order.status = "accepted"
    elsif order_params[:status] == "Refused"
      @order.status = "refused"
    end
    @order.save
    authorize @order
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :product_id, :user, :status)
  end

  def set_product
    @product = Product.find(order_params[:product_id])
  end
end
