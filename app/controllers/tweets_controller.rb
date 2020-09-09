class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
      flash[:notice] = "投稿しました"
    else  
      render :new
    end 
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit 
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path 
    else  
      render :edit 
    end
  end 

  def show 
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end 

  def search 
    @tweets = Tweet.search(params[:keyword])
  end 

  def gourmet
    @tweets = Tweet.includes(:user).where(category_id: 1).order("created_at DESC")
  end

  def spot
    @tweets = Tweet.includes(:user).where(category_id: 2).order("created_at DESC")
  end


  

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text, :category_id).merge(user_id: current_user.id)
  end 

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end 

  def move_to_index 
    unless user_signed_in?
      redirect_to action: :index 
    end 
  end 
end
