class UsersController < ApplicationController
  
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
    @user = current_user
    @followed = @user.following_users
    render 'show_follow'
  end
  
  def follwers
    @user = current_user
    @follower = @user.follower_users
    render 'show_follow'
  end
  
  
  #followings-followersここまで

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
