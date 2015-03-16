class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  	def index
  		@users = User.all
  	end

  	def show
  	end

  	def edit
  	end


	def new
    	@user = User.new
  	end

  	def update
  		user1 = User.find(params[:id])
  		user1.update( user_params )
  		session[:user] = user1
  		redirect_to '/'
  	end


  	def create
  		@user = User.new(user_params)
		if @user.valid?
			@user.save
			flash[:success] = "you did it!"
			puts "hello"
			redirect_to '/'
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to '/users/new'
		end

  	end

  	def destroy
  		User.find(params[:id]).destroy
  		redirect_to '/'
  	end


  	private
  		def set_user
    		@user = User.find(params[:id])
   		end
	  	def user_params
	  		params.require(:user).permit(:first_name, :last_name, :email, :password)
	  	end
end
