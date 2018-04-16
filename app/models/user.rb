class User < ApplicationRecord
  has_many :events, :foreign_key => 'creator_id', :class_name => 'Event'
  has_many :event_attendances, :foreign_key => :attendee_id
  has_many :attendances, :through => :event_attendances
  has_many :invitations, :foreign_key => :invitee_id
  has_many :invited_to_events, :through => :invitations
  has_many :invitation_requests, :foreign_key => :requester_id
  
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
 

  def prev_events
    self.attendances.where('date < ?', Time.zone.now)
  end
  
  def upcoming_events
    self.attendances.where('date > ?', Time.zone.now)
  end
end
