class SessionsController < ApplicationController
  
  def create
    flash[:success] = "SIGNED IN, SUCCESS\!"
    redirect_to root_url
  end

  def destroy
    flash[:success] = "SIGNED OUT"
    redirect_to root_url
  end
end
