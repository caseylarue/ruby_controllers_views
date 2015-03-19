class UsersController < ApplicationController
  def index
  end

  def new
  	@errors = flash[:errors]
    @error = flash[:error]
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		sign_in @user
  		redirect_to posts_path
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to new_user_path
  	end
  end

  def show

  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
