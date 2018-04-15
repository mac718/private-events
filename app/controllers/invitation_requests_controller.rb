class InvitationRequestsController < ApplicationController
  def create
    @user = User.find_by(name: session[:user_name])
    @event_id = params[:event_id]
    @request = InvitationRequest.new(requester_id: @user.id, event_id: @event_id)

    if @request.save 
      flash[:success] = "Request sent!"
      redirect_to '/events'
    else
      flash.now[:danger] = "The request could not be sent."
      render '/events/#{@event_id}'
    end
  end
end
