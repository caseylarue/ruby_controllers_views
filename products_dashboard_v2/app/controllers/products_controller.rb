class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      flash[:success] = "you did it!"
      redirect_to '/'
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to '/products/new'
    end
  end

  def update
    product1 = Product.find(params[:id])
    product1.update( product_params )
    #session[:product] = product1
    redirect_to '/'
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
