class CommentsController < ApplicationController
before_action :require_user_logged_in
before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.build(comments_params)
    if @comment.save 
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @comments = Comment.all.order(id: :desc).page(params[:page]).per(10)
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render 'toppages/index'
    end
  end
  

  def destroy
    @comment.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def comments_params
    params.require(:comment).permit(:weather, :temp, :humidity, :area_id, :content)
  end
  
  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    unless @comment
      redirect_to root_url
    end
  end
end
