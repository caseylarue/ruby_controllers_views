class WordsController < ApplicationController
  def index
  	if session[:count].nil?
  		session[:count] = 0
  	 end
  	 #session[:word] = (1..14).map {(65 + rand(26)).chr}.join
  end

  def generate
  	session[:word] = (1..14).map {(65 + rand(26)).chr}.join
  	session[:count] = session[:count] + 1
  	redirect_to "/"
  	#redirect_to("words/index")
  end

end
