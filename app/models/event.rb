class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :event_attendances, :foreign_key => :attendance_id
  has_many :attendees, :through => :event_attendances
  has_many :invitations, :foreign_key => :event_invited_to_id
  has_many :invitees, :through => :invitations
  has_many :invitation_requests

  validates :title, presence: true
  validates :description, presence: true
  VALID_DATE_REGEX = /(1|2)(9|0|1)\d{2}-(0|1|2|3)[0-9]-(0|1)[0-9]/
  validates :date, presence: true, format: { with: VALID_DATE_REGEX }
  validates :location, presence: true

  scope :upcoming, -> { where( 'date > ?', Time.zone.now ) }
  scope :past, -> { where( 'date < ?', Time.zone.now ) }
end
