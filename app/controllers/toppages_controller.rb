class ToppagesController < ApplicationController
  def index
    if logged_in?
      @myarea = weather_area(current_user.area.lat.to_f, current_user.area.lon.to_f)
      @y = y_day+3
      @comment = current_user.comments.build
      @comments = Comment.all.order(id: :desc).page(params[:page]).per(5)
      @comments_similar = Comment.where(
                       weather: @myarea["current"]["weather"][0]["main"]
                      ).where(area_id: current_user.area.id
                      ).where("temp <= #{similar_temp(1)}" 
                      ).where("temp >= #{similar_temp(-1)}"
                      ).where("humidity <= #{similar_humidity(10)}"
                      ).where("humidity >= #{similar_humidity(-10)}"
                      ).order(id: :desc).page(params[:page]).per(5)
      
    end
  end
  
  private

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
