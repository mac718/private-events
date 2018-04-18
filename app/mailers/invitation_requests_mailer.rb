class InvitationRequestsMailer < ApplicationMailer
  def invitation_request_email(requester, event_creator, event)
    @requester = requester
    @event_creator = event_creator
    @event = event

    mail(to: @event_creator.email, subject: "You've Received an Invitation Request for: #{@event.title}")
  end
end
