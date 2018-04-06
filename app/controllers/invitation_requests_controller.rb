class InvitationRequestsController < ApplicationController
  def create
    @user = User.find_by(name: session[:user_name])
    @event = params[:event_id]
    @request = InvitationRequest.new(requester_id: @user.id, event_id: @event)

    if @request.save 
      flash[:success] = "Request sent!"
      redirect_to '/events'
    else
      flash.now[:danger] = "The request could not be sent."
      render '/events/#{@event}'
    end
  end
end
