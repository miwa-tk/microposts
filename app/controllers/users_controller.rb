class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show #追加
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #ここを修正
    else
      render 'new'
    end
  end
  
  #followings-followersここから
  def followings
    @title = "followings"
    @user = User.find(params[:id])
    @users = @user.following_users

    render 'show_follow'
  end
  
  def follwers
    @title = "follwers"
    @user = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end
  
  
  #followings-followersここまで
  #USER-PROFILE修正ここから
  def edit
    if @user != current_user 
      redirect_to root_path
    end
  end
  
  def update
    if @user != current_user
      redirect_to root_path
    else
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
  end
  #USER-PROFILE修正ここまで    

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :nickname, :password, :password_confirmation)
  end
  
end
