class AreasController < ApplicationController
  before_action :require_user_logged_in

  def new
  end

  def create
    @area = Area.find_by(id: params[:area][:prefecture])
    redirect_to area_path(@area)
  end
  
  def show
    @area = Area.find(params[:id])
    @y = y_day+3
    @myarea = weather_area(@area.lat.to_f, @area.lon.to_f)
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
