class Api::V1::BaseController < ApplicationController

  respond_to :json

  attr_accessor :current_user
  
  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  #before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  skip_before_filter :verify_authenticity_token


  def api_error(opts = {})
    render nothing: true, status: opts[:status]
  end

  def unauthenticated!
    api_error(status: 401)
  end

  def authenticate_user!
    
    token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

    user_email = options.blank?? nil : options[:email] 
    user = user_email && User.find_by(email: user_email)
    
    if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token) 
      @current_user = user
    else
       return unauthenticated!
    end
   end

end  