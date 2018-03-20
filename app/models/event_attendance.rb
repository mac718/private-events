class EventAttendance < ApplicationRecord
  belongs_to :attendance, :class_name => 'Event'
  belongs_to :attendee, :class_name => 'User'
end
