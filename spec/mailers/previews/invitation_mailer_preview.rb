# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview
  def invitation_email
    InvitationMailer.invitation_email(User.last, User.last, Event.last)
  end
end
