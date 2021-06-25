class ApplicationController < ActionController::Base
  #アクション時に、ログインをしているかどうか確認してくれるコード
  #exceptは、ログインしていなくても記載したアクションは許可するというもの
  before_action :authenticate_user!, except: [:show, :index, :top, :about]
  #deviseのコントローラーが動いているかどうか確認し、動いていたらconfigure_permitted_parametersの値を持ってくるコード
  before_action :configure_permitted_parameters , if: :devise_controller?

  # (resource)の代わりにアスタリスクを入れた
  def after_sign_in_path_for(*)
    tweets_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :birth_date])
  end
end
