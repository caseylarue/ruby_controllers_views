class CommentsController < ApplicationController
  	def index
  		@results = Comment.joins(:product).select('comments.*, products.name AS product_name')
  		@comments = @results
  	end

  	def create
	    @comment = params[:comment]
	 	@comment = params[:comment]
  		@id = @comment[:id].to_i
    	@comment = Comment.new(comment:@comment[:comment], product_id:@id)	
    	if @comment.valid?
      		@comment.save
     		flash[:success] = "you did it!"
      		redirect_to '/products/' + params[:comment][:id]
    	else
      		flash[:errors] = @comment.errors.full_messages
      		redirect_to '/products/' + params[:comment][:id]
    	end
  	end

  	def new
  		@comment = Comment.new
  	end

end
