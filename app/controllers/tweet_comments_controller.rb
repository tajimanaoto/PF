class TweetCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_comment = TweetComment.new(tweet_comment_params)
    @tweet_comment.tweet_id = @tweet.id
    @tweet_comment.user_id = current_user.id
    @tweet_comment.save
     redirect_to request.referer
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_comment = @tweet.tweet_comments.find(params[:id])
    @tweet_comment.destroy
  end


  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment, :rate)
  end


end
