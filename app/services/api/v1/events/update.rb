class Api::V1::Events::Update < Api::V1::BaseService

  def self.call(params, event_id, current_user_id)

    allowed_keys = %i[name description location start_time end_time ticket_price]

    return fail_response({ message: 'You provided an empty request' }) if params.nil?

    updateable_params = params.slice(*allowed_keys)
    return fail_response({ message: 'Invalid event id' }) unless event_id.positive?
    begin
      event = Event.find_by(id: event_id)
      return fail_response({ message: 'Event not found' }) if event.nil?

      return fail_response({ message: 'You are not authorized to update this event' }) unless event.user_id == current_user_id

      success_response("The event #{event.name} was updated successfully")
    rescue StandardError => e
      fail_response({ message: "Error: #{e.message}" }, 403)
    end
  end
end
