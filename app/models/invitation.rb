class Invitation < ApplicationRecord
  belongs_to :event_invited_to, :class_name => "Event"
  belongs_to :invitee, :class_name => "User"
end
