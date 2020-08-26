class ApplicationController < ActionController::Base

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def require_login_user
    unless current_user?
      redirect_to root_url
    end
  end

  def weather_area(lat,lon)
    url = "http://api.openweathermap.org/data/2.5/onecall"
    api_key = ENV['API_KEY']

    response = open(url + "?lat=#{lat}&lon=#{lon}&units=metric&exclude=minutely&lang=ja&APPID=#{api_key}")
    JSON.parse(response.read)
  end

  def godcounts(comment)
    @count_goods = comment.goodusers.count
    @count_bads = comment.badusers.count
  end

end
