class OrdersController < ApplicationController
  before_action :set_product, only: [:new, :create]
  def index
    @orders = Order.where(user: current_user)
  end

  def new
    @order = Order.new(product: @product)
    @owner = @order.product.user
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to new_product_order_payment_path(@order)
  end

  def edit
  end

  def show
    order = Order.new(product: @product)
    @owner = @order.product.user
    authorize @order
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :amount_cents, :product_id, :user_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
