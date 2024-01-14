class Api::V1::Tickets::Update < Api::V1::BaseService

  def self.call(params, ticket_id, current_user_id)
    allowed_keys = %i[buyer_name quantity]
    return fail_response({ message: 'You provided an empty request' }) if params.nil?

    updateable_params = params.slice(*allowed_keys)
    return fail_response({ message: 'Invalid event id' }) unless ticket_id.positive?

    begin
      ticket = Ticket.find_by(id: ticket_id)
      return fail_response({ message: 'Ticket not found' }) if ticket.nil?

      return fail_response({ message: 'You are not authorized to update this event' }) unless ticket.user_id == current_user_id

      ticket.update!(updateable_params)
      success_response("The ticket was updated successfully")
    rescue StandardError => e
      fail_response({ message: "Error: #{e.message}" }, 403)
    end
  end

end
