class EventAttendancesController < ApplicationController
  def new
  end

  def create
    byebug
    user = User.find_by(name: session[:user_name])
    event = Event.find(params[:event_id])
    attendance = EventAttendance.new(attendance_id: event.id, attendee_id: user.id)

    if attendance.save
      redirect_to @event
    else
      render :index
    end
  end

  def destroy
  end
end
