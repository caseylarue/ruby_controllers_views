class UsersController < ApplicationController
  	def index
  		#session.clear
  		@users = User.all
  	end

	def new
		#session.clear
    	@user = User.new
  	end

  	def create
  		#@user = User.create(user_params)

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

  	private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
