class Api::V1::Events::Create < Api::V1::BaseService

  def self.call(params, current_user)
    required_params = %i[name description location start_time end_time ticket_price tickets_threshold]
    return fail_response({message: 'Incomplet information'},403) unless required_fields_present?(params, required_params)
    params[:user_id] = current_user.id
    begin
      Event.create(params)
      success_response("#{params[:name]} event was created successfuly")
    rescue StandardError => e
      fail_response({ message: "unknow error #{e.message}" }, 403)
    end

  end
end
