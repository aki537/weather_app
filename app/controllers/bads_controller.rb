class BadsController < ApplicationController
  def create
    comment = Comment.find(params[:comment_id])
    current_user.badpost(comment)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    current_user.unbad(comment)
    redirect_back(fallback_location: root_path)
  end
end
