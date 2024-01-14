class Api::V1::Tickets::Show < Api::V1::BaseService

  def self.call(ticket_id)
    ticket = Ticket.find_by(id: ticket_id)
    if ticket
      success_response(ticket)
    else
      fail_response({ message: "Ticket not found" })
    end
  end
end
