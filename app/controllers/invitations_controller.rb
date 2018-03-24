class InvitationsController < ApplicationController
  

  def create
    @inviter = User.find_by(name: session[:user_name])
    @inviter_events = @inviter.events
    @invited_to_event = Event.find(params[:event_id])
    @invited_user = User.find_by(name: params[:invitation][:invitee_name])
    @invitation = Invitation.new(event_invited_to_id: @invited_to_event.id, invitee_id: @invited_user.id)
    
    if @invitation.save
      redirect_to event_path(@invited_to_event.id)
    else 
      render 'events/index'
    end
  end

  def destroy
  end
end
