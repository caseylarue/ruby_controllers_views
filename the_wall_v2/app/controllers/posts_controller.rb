class PostsController < ApplicationController
  before_action :require_signed_in

  def index
  	@user = User.find(session[:user_id])
  	@post = Post.new
  	@posts = User.find(session[:user_id]).posts
  	@comments = Comment.all
    @comment = Comment.new
    @errors = flash[:errors]
  end

  def new
  end

  def create
  	params[:post][:user_id] = session[:user_id]
  	@post = Post.create(post_params)
  	if @post.valid?
  		@post.save
  	else 
  		flash[:errors] = @post.errors.full_messages
 	end
 	redirect_to posts_path
  end

  def post_params
  	params.require(:post).permit(:message, :user_id)
  end
end
