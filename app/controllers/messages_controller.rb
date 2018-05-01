class MessagesController < ApplicationController
  before_action :set_order

  def create
    if Message.between(params[:sender_id], params[:recepient_id])
    @message = Message.new(message_params)
    if sender == @order.user
      recepient = @order.product.user
    elsif sender == @order.product.user
      recepient = @order.user
    end
    @message.order = @order
    if @message.save
      redirect_to order_path(@order)
    else
      render 'new'
    end
    authorize @message
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def message_params
    params.require(:message).permit(:content, :order, :user)
  end
end
