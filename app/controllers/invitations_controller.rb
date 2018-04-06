class InvitationsController < ApplicationController

  def create
    @inviter = User.find_by(name: session[:user_name])
    @inviter_events = @inviter.events
    @invited_to_event = Event.find(params[:event_id])
    byebug
    @invited_user = User.find_by(name: params[:invitation][:invitee_name])
    @invitation = Invitation.new(event_invited_to_id: @invited_to_event.id, invitee_id: @invited_user.id)
    @invitation_request_id = InvitationRequest.where('requester_id = ? AND event_id = ?', @invited_user.id, @invited_to_event.id)[0].id
    
    if @invitation.save
      if @invitation_request_id
        InvitationRequest.destroy(@invitation_request_id)
      end
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

