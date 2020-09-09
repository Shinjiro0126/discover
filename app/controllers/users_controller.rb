class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :likes]

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

  def likes
    @user = User.find_by(id: current_user.id) 
    @likes = Like.where(user_id: @user.id) 
    @nickname = @user.nickname 
    @profile = @user.profile 
    @count = @user.tweets.count
    @image = @user.user_image
  end

  def gourmet
    @user = User.find(params[:id]) 
    @tweets = @user.tweets.where(category_id: 1).order("created_at DESC") 
    @nickname = @user.nickname 
    @profile = @user.profile 
    @count = @user.tweets.count
    @image = @user.user_image
  end

  def spot
    @user = User.find(params[:id]) 
    @tweets = @user.tweets.where(category_id: 2).order("created_at DESC") 
    @nickname = @user.nickname 
    @profile = @user.profile 
    @count = @user.tweets.count
    @image = @user.user_image
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
