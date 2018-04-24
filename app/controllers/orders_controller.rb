class OrdersController < ApplicationController
  before_action :set_user
  def index
    @orders = Order.where(user: current_user)
  end

  def new
    @products = @user.products
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      flash[:notice] = "Your order is confirmed you little piece of shit"
    else

  end

  def edit
  end

  def update
  end

  private

  def order_params
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
