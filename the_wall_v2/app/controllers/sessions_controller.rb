class SessionsController < ApplicationController
	def index
  		@user = current_user
  		puts @user
  	end

	#bring up a form for a new session aka login form
 	def new
  	end

  	#create the session resource i.e. let the user login
  	def create
  		#this references the function we made in user.rb
  		user = User.authenticate(params[:session][:email], params[:session][:password])
  		if user.nil?
  			flash[:error] = user.errors.full_messages
  			redirect_to new_session_path
  		else
  			sign_in user
  			redirect_to posts_path
  		end
  	end

  	def destroy
  		sign_out
  		redirect_to signin_path
  	end
end
