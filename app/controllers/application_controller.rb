class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_logged_in_to_view_stuff

  def require_logged_in_to_view_stuff
    redirect_to new_session_url unless current_user
  end

  def current_user
    if session[:session_token]
      @current_user ||= User.find_by(session_token: session[:session_token])
    else
      nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
end
