class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      flash.now[:warning] = "Uh oh, something went wrong."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @upcoming = Event.upcoming
    @signed_in_user = User.find_by(name: session[:user_name])
  end

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  private 
    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end

    def current_user
      User.find_by(name: session[:user_name])
    end
end
