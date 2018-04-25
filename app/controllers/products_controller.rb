class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:city].present?
      @products = Product.near(params[:city], 50)
    else
      @products = Product.all
    end

    @markers = @products.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end


    authorize @products
  end



  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.price_cents *= 100
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

  def edit
    authorize @product
  end

  def update
    @product.update(product_params)
    @product.price_cents *= 100
   redirect_to product_path(@product)
  end

  def show
    @order = Order.new
    @product_images = @product.product_images
    @markers =
      [{
        lat: @product.latitude,
        lng: @product.longitude,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
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
