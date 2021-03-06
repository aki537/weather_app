class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  
  def edit
    @user = User.find(params[:id])
    require_login_user
  end
  
  def update
    @user = User.find(params[:id])
    require_login_user

    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました'
      redirect_to @user
    else
      flash.now[:danger] = '変更に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    require_login_user
    
    @user.destroy

    flash[:danger] = 'ユーザー情報を削除しました'
    redirect_to root_url

  end

  private

  def user_params
    params.require(:user).permit(:name, :area_id, :email, :password, :password_confirmation)
  end
end
