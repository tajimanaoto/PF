class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:show, :index]
  before_action :configure_permitted_parameters , if: :devise_controller?

  def after_sign_in_path_for(resource)
    movies_search_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :birth_date])
  end
end
