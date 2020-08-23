class ToppagesController < ApplicationController
  def index
    if logged_in?
      @myarea = weather_area(current_user.area.lat.to_f, current_user.area.lon.to_f)
      @a = y_day
    end
  end
  
  private

  def y_day
    time = Time.current.tomorrow.to_i
    lat = current_user.area.lat.to_f
    lon = current_user.area.lon.to_f
    yday = weather_area(lat,lon)
    array = (0..23).to_a
    
    array.each do |a|
      if time < yday["hourly"][a]["dt"]
        return a
      end
    end
      
  end

end
