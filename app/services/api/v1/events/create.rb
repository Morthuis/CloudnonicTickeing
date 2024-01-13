class Api::V1::Events::Create < Api::V1::BaseService

  def self.call(params, current_user_id)

    required_fields = %i[name description location start_time end_time ticket_price tickets_threshold]
    unless required_fields_present?(params, required_fields)
      return fail_response({message: "Missing information: #{missing_params(params, required_fields)}"},403)
    end
    params[:user_id] = current_user_id
    begin
      Event.create(params)
      success_response("#{params[:name]} event was created successfully")
    rescue StandardError => e
      byebug
      fail_response({ message: "Error: #{e.message}" }, 403)
    end
  end
end
