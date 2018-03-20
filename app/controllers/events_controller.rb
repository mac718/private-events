class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    byebug
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @upcoming = Event.upcoming
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
