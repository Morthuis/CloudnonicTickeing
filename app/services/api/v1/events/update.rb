class Api::V1::Events::Update < Api::V1::BaseService

  def self.call(params, event_id, current_user_id)

    allowed_keys = %i[name description location start_time end_time ticket_price]

    return fail_response({ message: 'You provided an empty request' }) if params.nil?

    updateable_params = params.slice(*allowed_keys)
    return fail_response({ message: 'Invalid event id' }) unless event_id.positive?

    event = Event.find_by(id: event_id)
    return fail_response({ message: 'Event not found' }) if event.nil?

    if event.update(updateable_params)
      success_response("The event #{event.name} was updated successfully")
    else
      fail_response(message: 'The event was not updated')
    end

  end
end
