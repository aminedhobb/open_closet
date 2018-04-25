class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @products = Product.all
    authorize @products
  end

  def show
    @order = Order.new
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      unless params[:product]["photos"].nil?
        params[:product]["photos"]["photo"].each do |a|
          @product_image = @product.product_images.create!(:photo => a)
        end
      end
      redirect_to products_path
    else
      render :new
    end
    authorize @product
  end




  private

  def product_params
    params.require(:product).permit(:title, :category, :price_cents, :address, :description, :gender, product_images_attributes: [:id, :product_id, :photo])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
