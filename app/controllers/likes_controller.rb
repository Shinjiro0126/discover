class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def destroy
    @like = current_user.likes.find_by(tweet_id: @tweet.id)
    @like.destroy
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
