class SessionsController < ApplicationController
  def new
  end

  def create 
    session[:user_name] = params[:session][:name] 
    flash[:success] = "You're in!"
    redirect_to User.find_by(name: session[:user_name])
  end

  def destroy
  end
end
