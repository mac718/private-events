class User < ApplicationRecord
  has_many :events, :foreign_key => 'creator_id', :class_name => 'Event'
  has_many :event_attendances, :foreign_key => :attendee_id
  has_many :attendances, :through => :event_attendances


  def prev_events
    self.attendances.where('date < ?', Time.zone.now)
  end
  
  def upcoming_events
    self.attendances.where('date > ?', Time.zone.now)
  end
end
