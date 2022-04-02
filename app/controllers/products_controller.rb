class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy edit]

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id 
    # unless session[:cart].include?(id)
    redirect_to products_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to products_path
  end

  def index
    @products = Product.all
    if request.xhr? || request.format.js?
      if params[:search].present?
        @products = @products.where("lower(name) LIKE :search", search:"%#{params[:search].downcase}%")
        # render(template:  'products/_product_list', layout: false)
        render :index
      end
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit  
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :price_cents, :currency)
    end
end
