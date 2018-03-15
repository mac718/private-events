class SessionsController < ApplicationController
  def new
  end

  def create
    session[:user_name] = params[:session][:name] 
    redirect_to User.find_by(name: session[:user_name])
  end

  def destroy
  end
end
