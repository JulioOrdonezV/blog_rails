class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

  def logged_in_user
    unless is_logged_in?
      flash[:error] = "YOU NEED TO SIGN IN FIRST!"
      redirect_to root_url
    end
  end

  helper_method :current_user, :is_logged_in?, :logged_in_user

end
