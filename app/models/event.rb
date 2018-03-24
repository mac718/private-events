class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :event_attendances, :foreign_key => :attendance_id
  has_many :attendees, :through => :event_attendances
  has_many :invitations, :foreign_key => :event_invited_to_id
  has_many :invitees, :through => :invitations
  scope :upcoming, -> { where( 'date > ?', Time.zone.now ) }
  scope :past, -> { where( 'date < ?', Time.zone.now ) }
end
