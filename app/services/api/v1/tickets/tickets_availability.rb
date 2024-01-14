class Api::V1::Tickets::TicketsAvailability < Api::V1::BaseService

  def self.call(event_id)
    event = Event.find_by(id: event_id)
    return fail_response({ message: 'Event not found' }, 404) if event.nil?

    success_response("There are #{event.tickets_remind} tickets remind for #{event.name}")
  end
end
