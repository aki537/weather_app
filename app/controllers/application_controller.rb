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

  def y_day
    time = Time.current.tomorrow.midnight.to_i
    lat = current_user.area.lat.to_f
    lon = current_user.area.lon.to_f
    yday = weather_area(lat,lon)
    
    array = (0..23).to_a
    
    array.each do |a|
      if time <= yday["hourly"][a]["dt"]
        return a
      end

    end
  end

  def similar_temp(n)
    temp = @myarea["current"]["temp"].to_i + n
  end

  def similar_humidity(n)
    humidity = @myarea["current"]["humidity"] + n
  end
  
end
