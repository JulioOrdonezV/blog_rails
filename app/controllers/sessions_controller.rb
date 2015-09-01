class SessionsController < ApplicationController

  def create
    user = User.sign_in_from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "SIGNED IN, SUCCESS\!"
    redirect_to root_url
  end

  def destroy
  	session[:user_id] = nil
    current_user = nil
    flash[:success] = "SIGNED OUT"
    redirect_to root_url
  end
end
