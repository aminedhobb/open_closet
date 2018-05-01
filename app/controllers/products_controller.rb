class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:address].present?
      @products = Product.near(params[:address],50)
    else
      @products = Product.all
    end

    if params[:title_or_description].present?
      @products = @products.search_by_title_and_description_and_category(params[:title_or_description])
    end

    if @products.empty?
      render 'product_not_found'
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
    @product.price_cents *= 100 if @product.price_cents.present?
    @product.user = current_user

    if @product.save
      unless params[:product]["photos"].nil?
        params[:product]["photos"]["photo"].each do |a|
          @product_image = @product.product_images.create!(:photo => a)
        end
      end
      ProductMailer.creation_confirmation(@product).deliver_now
      flash[:notice] = "Your product is now online!"
      redirect_to product_path(@product)
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
    unless params[:product]["photos"].nil?
        params[:product]["photos"]["photo"].each do |a|
          @product_image = @product.product_images.create!(:photo => a)
      end
    end
    authorize @product
    redirect_to product_path(@product)
  end

  def show
    @order = Order.new
    @product_orders = @product.orders
    @product_images = @product.product_images
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
