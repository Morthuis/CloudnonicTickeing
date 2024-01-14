class Api::V1::Tickets::TicketsList < Api::V1::BaseService

  def self.call(event_id)
    event = Event.find_by(id: event_id)
    return fail_response({ message: 'Event not found' }, 404) if event.nil?

    success_response(event.tickets)
  end
end
