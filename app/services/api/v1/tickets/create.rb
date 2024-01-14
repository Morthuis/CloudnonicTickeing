class Api::V1::Tickets::Create < Api::V1::BaseService

  def self.call(params)
    required_fields = %i[buyer_name quantity event_id]
    unless required_fields_present?(params, required_fields)
      return fail_response({ message: "Missing information: #{missing_params(params, required_fields)}" })
    end
    event = Event.find_by(id: params[:event_id])
    return fail_response({ message: 'Event not found' }) if event.nil?

    unless event.tickets_available?(params[:quantity])
      return fail_response({ message: 'No enough tickets available for this event', tickets_available: event.tickets_remind }, 405)
    end
    begin
      params[:total_price] = params[:quantity] * event.ticket_price
      Ticket.create!(params)
      success_response("Congratulations, you have purchases #{params[:quantity]} tickets for #{event.name}")
    rescue StandardError => e
      fail_response({ message: "Error: #{e.message}" }, 403)
    end
  end
end
