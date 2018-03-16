class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    byebug
    @event = current_user.events.build(description: params[:event][:description])

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private 
    def current_user
      User.find_by(name: session[:user_name])
    end
end
