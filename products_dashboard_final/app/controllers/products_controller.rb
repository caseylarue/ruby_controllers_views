class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    #@products = Product.all
    @products = Product.joins(:category).select('products.*, categories.name as category_name')
  end

  def show
    @comment = Comment.new
    #@result = Product.joins(:category).select('products.*, categories.name as category_name').where('products.id = ?', params[:id].to_i) 
    @result = Product.joins(:category, :comments).select('products.*, categories.name as category_name, comments.comment').where('products.id = ?', params[:id].to_i)
    @result2 = Product.joins(:category).select('products.*, categories.name as category_name').where('products.id = ?', params[:id].to_i) 
      
    if @result.empty?
      @product = @result2.first
      @comments = nil
    else
      @product = @result.first
      @comments = Comment.where('product_id = ?', params[:id].to_i)
    end

  end

  def new
    @product = Product.new
  end

  def edit
    @categories = Category.all
    @result = Product.joins(:category).select('products.*, categories.name as category_name').where('products.id = ?', params[:id].to_i)   
    @product = @result.first
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
    puts "HELLO in the update"
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
      params.require(:product).permit(:name, :description, :price, :category, :category_id)
    end
end
