class ToppagesController < ApplicationController
  def index
    if logged_in?
      @area = current_user.area
      @myarea = weather_area(current_user.area.lat.to_f, current_user.area.lon.to_f)
      @y = y_day+3
      @comment = current_user.comments.build
      @comments = Comment.all.order(id: :desc).page(params[:page]).per(5)
      @comments_similar = Comment.where(
                       weather: @myarea["current"]["weather"][0]["main"]
                      ).where("temp <= #{similar_temp(1)}" 
                      ).where("temp >= #{similar_temp(-1)}"
                      ).where("humidity <= #{similar_humidity(10)}"
                      ).where("humidity >= #{similar_humidity(-10)}"
                      ).order(id: :desc).page(params[:page]).per(5)
      
    end
  end


end
