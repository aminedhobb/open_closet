class OrdersController < ApplicationController
  def index
    @orders = Order.where(user: current_user)
  end

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new(product: @product)
    @owner = @order.product.user
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      flash[:notice] = "Your order is confirmed you little piece of shit"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :amount_cents, :product_id, :user_id)
  end
end
