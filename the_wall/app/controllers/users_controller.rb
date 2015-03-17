class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
 	@user = User.new(user_params)
    if @user.save
      #sign_in @user
      flash[:notice] = 'New user created!'
      session[:user] = @user
      redirect_to '/users/show'
      #redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def show

  end

   #define strong parameters!
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
