class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id 
      flash[:success] = "You're in!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combo.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
