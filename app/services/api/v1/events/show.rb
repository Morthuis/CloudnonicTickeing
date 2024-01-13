class Api::V1::Events::Show < Api::V1::BaseService

  def self.call(event_id)
    event = Event.find_by(id: event_id)
    if event
      success_response(event)
    else
      fail_response({ message: 'Event not found' }, 404)
    end
  end
end
