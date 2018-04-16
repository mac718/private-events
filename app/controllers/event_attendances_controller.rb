class EventAttendancesController < ApplicationController
  def new
  end

  def create
    @user = User.find(session[:user_id])
    @event = Event.find(params[:event_id])
    @attendance = EventAttendance.new(attendance_id: @event.id, attendee_id: @user.id)

    if @event.invitees.include?(@user)
      if @attendance.save
        flash[:success] = "You're on the guest list!"
        redirect_to @event
      else
        flash.now[:warning] = "Uh oh, something went wrong."
        render :index
      end
    else
      flash[:danger] = "You can't attend an event unless you have an invitation!"
      redirect_to @event
    end
  end

  def destroy
  end
end
