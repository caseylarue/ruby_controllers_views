class ProductsController < ApplicationController
  	def index
	  	@products = Product.all
	  	# render json: @products  #good for creating apis
  	end ##end of index method


  	def new
	  	# @product = Product.create( name: params[:name], description: params[:description])
	  	# redirct_to '/products/index'
  	end ##end of new method


  	def create
	  	#render :text => "came to the create method"
	  	#@product = Product.create( name: params[:name], description: params[:description])
	  	#@product = Product.create( params[:product] )
	  	
  	 	@product = Product.create( product_params )
	  	# if errors?
	   #    flash[:error] = "You have errors"
	   #    redirect_to '/products/index' #pathing will be explained later
	   #  else
	   #    flash[:success] = "You did it!"
	   #    redirect_to '/products/index'
	   #  end

	  	puts @product  #whatever gets printed on the controller would show up in the console
	  	#puts "\n\n\n\n\n", @product.inspect, "\n\n\n"  #prints to the terminal ruby server
	  	#render :text => @product.inspect  #similar to var dump and die
	  	redirect_to '/products/index'
	    #adds the value in params[:id] to the :id key in session
	    # session[:id] = params[:id] #we will talk about params in a bit
 	end ##end of create method

 	private def product_params
   		params.require(:product).permit(:name, :description)
  	end


 	def update
  		@product = Product.update( product_params )
  		redirect_to '/products/'
	end


  	def log_out
	    #sets the session[:id] to nil, overwriting the previous value
	    session[:id] = nil
  	end  ##end of logout method

end
