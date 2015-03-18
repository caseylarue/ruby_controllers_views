class CommentsController < ApplicationController
  	def index
  		@comments = Comment.joins(:product).select('comments.comment, products.name AS product_name')
  	end

  	def create
	    @comment = params[:comment]
	 	@comment = params[:comment]
  		@id = @comment[:id].to_i
  		#@comment = Comment.create(comment:@comment[:comment], product_id:@id)
    	@comment = Comment.new(comment:@comment[:comment], product_id:@id)
    	

    	if @comment.valid?
      		@comment.save
     		flash[:success] = "you did it!"
      		redirect_to '/products/' + params[:comment][:id]
    	else
      		flash[:errors] = @comment.errors.full_messages
      		redirect_to '/products/' + params[:comment][:id]
    	end


    	#redirect_to '/products/' + params[:comment][:id]
  	end

  	def new
  		@comment = Comment.new
  	end

  	def show
  		@comment = Comment.new
  	end
end
