class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id]) 
    @tweets = @user.tweets.order("created_at DESC") 
    @nickname = @user.nickname 
    @profile = @user.profile 
    @count = @user.tweets.count
    @image = @user.user_image
  end 

  def edit
    @user = User.find(params[:id])    
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profileを更新しました"
      redirect_to user_path
    else 
      render :edit 
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:nickname, :email, :user_image, :profile)
  end 

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path 
    end
  end
end
