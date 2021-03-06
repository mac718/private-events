class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
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
    @created_events = @user.events
    @invitations = @user.invitations
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
