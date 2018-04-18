class InvitationRequestsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @event_id = params[:event_id]
    @request = InvitationRequest.new(requester_id: @user.id, event_id: @event_id)
    @event = Event.find(@event_id)

    if @request.save
      InvitationRequestsMailer.invitation_request_email(@user, @event.creator, @event).deliver_now

      flash[:success] = "Request sent!"
      redirect_to '/events'
    else
      flash.now[:danger] = "The request could not be sent."
      render '/events/#{@event_id}'
    end
  end
end
