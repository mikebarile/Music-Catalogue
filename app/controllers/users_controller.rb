class UsersController < ApplicationController
  before_action :cant_be_logged_in, only: [:new, :create]
  before_action :require_correct_log_in, only: [:show]

  def cant_be_logged_in
    redirect_to user_url(current_user) if current_user
  end

  def require_correct_log_in
    user = User.find(params[:id])
    if session[:session_token] != user.session_token
      flash[:errors] = 'Must be logged in to view this page!'
      if logged_in?
        redirect_to user_url(current_user)
      else
        redirect_to new_session_url
      end
    end
  end

  def require_logged_in_to_view_stuff
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user && user.save
      log_in_user!(user)
      redirect_to bands_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
