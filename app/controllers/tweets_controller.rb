class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweet_path(@tweet.id), notice: "投稿完了！"
    else
      @tweets = Tweet.all
      render :index
    end
  end

  def update
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to user_path(current_user)
  end

  private
  def tweets_params
   params.require(:tweet).permit(:title, :description, :image)
  end
end
