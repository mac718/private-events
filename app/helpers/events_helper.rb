module EventsHelper
  def event_attendable?(upcoming_events, current_event, current_user)
    upcoming_events.include?(current_event) && 
      current_event.creator != current_user && 
      current_event.invitees.include?(current_user) && 
      !current_event.attendees.include?(current_user)
  end

  def invitation_requestable?(current_event, current_user)
    current_event.invitation_requests.where("requester_id = ?", current_user.id).empty? && 
      !current_user.attendances.include?(current_event) && 
      current_user.id != current_event.creator_id
  end
end
