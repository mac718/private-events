class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if session[:user_name]
      session[:user_name] = nil
    end

    if @user.save
      flash[:success] = 'Account created!'
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @prev_events = @user.prev_events
    @upcoming_events = @user.upcoming_events
    
    byebug
  end

  private 
    def user_params
      params.require(:user).permit(:name)
    end
end
