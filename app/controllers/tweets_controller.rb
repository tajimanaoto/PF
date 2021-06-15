class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @tweet = Tweet.new(tweets_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path, notice: "投稿完了！"
    else
      @tweets = Tweet.all
      render :index
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweets_params)
      redirect_to user_path(current_user), notice: "You have update tweet succssfully"
    else
      render :edit
    end
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
