class UsersController < ApplicationController
  def new

  end

  def index
    @users = User.all()
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :profile_image_url, :description)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
