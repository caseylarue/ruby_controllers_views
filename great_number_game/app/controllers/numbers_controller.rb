class NumbersController < ApplicationController
  def index
  	if session[:number].nil?
  		session[:number] = rand(1..100)
  		puts session[:number].class
  	end
  end

  def guess
  	#flash[:guess]
	@guess =  params[:guess].to_i
	if @guess > session[:number]
		flash[:answer] = "High"
	elsif @guess < session[:number]
		flash[:answer] = "Low"
	else
		flash[:answer] = "Correct"
		#session[:number] = nil
	end
	redirect_to '/'
  end

  def new
  	session.clear
  	redirect_to '/'
  end
end


