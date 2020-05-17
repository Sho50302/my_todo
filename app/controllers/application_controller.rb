class ApplicationController < ActionController::Base
  before_action :basic_auth
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :user_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :user_image])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 's517'
    end
  end
end
