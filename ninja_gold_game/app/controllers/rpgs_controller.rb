class RpgsController < ApplicationController
  def index
    #session.clear
    if session[:gold].nil?
      session[:gold] = 0
      session[:activity] = []
    end
  end

  def farm
    @rand = rand(10..20)
    @time = Time.now.strftime("%m/%d/%Y  %I:%M %p")
    session[:activity].push(["You pressed Farm, and earned #{@rand} gold   #{@time}"])
    session[:gold] += @rand
    redirect_to '/'
  end

  def cave
    @rand = rand(5..10)
    @time = Time.now.strftime("%m/%d/%Y  %I:%M %p")
    session[:activity].push(["You pressed Cave, and earned #{@rand} gold   #{@time}"])
    session[:gold] += @rand
    redirect_to '/'
  end

  def house
    @rand = rand(2..5)
    @time = Time.now.strftime("%m/%d/%Y  %I:%M %p")
    session[:activity].push(["You pressed House, and earned #{@rand} gold  #{@time}"])
    session[:gold] += @rand
    redirect_to '/'
  end

  def casino
    @rand = rand(-50..50)
    @time = Time.now.strftime("%m/%d/%Y  %I:%M %p")
    session[:activity].push(["You pressed Casino, and earned #{@rand} gold  #{@time}"])
    session[:gold] += @rand
    redirect_to '/'
  end
end
