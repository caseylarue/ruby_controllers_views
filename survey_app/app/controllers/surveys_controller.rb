class SurveysController < ApplicationController	
  
  def index
  	if session[:counter].nil? 
  		session[:counter] = 0
  	end
  end

  def create
  	session[:counter] = session[:counter] + 1
  	session[:student] = params[:survey]
  	redirect_to '/surveys/result'
  	#render :text => @survey.inspect 
  end

  def result
  end
end
