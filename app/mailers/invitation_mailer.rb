class InvitationMailer < ApplicationMailer
  def invitation_email(inviter, invitee, event)
    @inviter = inviter
    @invitee = invitee
    @event = event

    mail(to: @invitee.email, subject: "You've Been Invited to an Event: #{@event.title}")
  end
end
