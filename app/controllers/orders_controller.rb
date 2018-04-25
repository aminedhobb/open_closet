class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]
  def index
    @orders = Order.where(user: current_user)
  end

  def new
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

  def edit
  end

  def show
    @order = Order.find(params[:id])
    @owner = @order.product.user
    authorize @order
  end

  def update

    # charge = Stripe::Charge.create(
  #   customer:     customer.id,   # You should store this customer id and re-use it.
  #   amount:       @order.amount_cents,
  #   description:  "Payment for product #{@order.product_id} for order #{@order.id}",
  #   currency:     @order.amount.currency
  # )
  # @order.update(payment: charge.to_json, state: 'paid')
  # redirect_to order_path(@order)

  # rescue Stripe::CardError => e
  # flash[:alert] = e.message
  # redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :product_id, :user)
  end

  def set_product
    @product = Product.find(order_params[:product_id])
  end
end
