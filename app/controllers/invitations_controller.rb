class InvitationsController < ApplicationController

  def create
    @inviter = User.find(session[:user_id])
    @inviter_events = @inviter.events
    @invited_to_event = Event.find(params[:event_id])
    @invited_user = User.find_by(name: params[:invitation][:invitee_name])
    @invitation = Invitation.new(event_invited_to_id: @invited_to_event.id, invitee_id: @invited_user.id)
    if InvitationRequest.where('requester_id = ? AND event_id = ?', @invited_user.id, @invited_to_event.id)[0]
      @invitation_request_id = InvitationRequest.where('requester_id = ? AND event_id = ?', @invited_user.id, @invited_to_event.id)[0].id
    end

    if @invitation.save
      if @invitation_request_id
        InvitationRequest.destroy(@invitation_request_id)
      end

      InvitationMailer.invitation_email(@inviter, @invited_user, @invited_to_event).deliver_now

      flash[:success] = "Invitation sent!"
      redirect_to event_path(@invited_to_event.id)
    else 
      flash[:warning] = "The invitation could not be created."
      redirect_to 'views/events/index'
    end
  end

  def destroy
  end

end

