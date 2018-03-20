class Event < ApplicationRecord
  belongs_to :creator, :class_name => "User"
  has_many :event_attendances, :foreign_key => :attendance_id
  has_many :attendees, :through => :event_attendances
  scope :upcoming, -> { where( 'date > ?', Time.zone.now ) }
  scope :past, -> { where( 'date < ?', Time.zone.now ) }
end
