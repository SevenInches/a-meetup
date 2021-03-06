class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    redirect_to login_url, alert: 'Please log in first' if current_user.nil?
  end

  private

  def current_user
    @current_user ||= User.find_by_authentication_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user
end
