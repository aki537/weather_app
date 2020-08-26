class GoodsController < ApplicationController
  def create
    comment = Comment.find(params[:comment_id])
    current_user.goodpost(comment)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    nt.find(params[:comment_id])
    current_user.ungood(comment)
    redirect_back(fallback_location: root_path)
  end
end
