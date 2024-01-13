class Api::V1::BaseService

  def self.required_fields_present?(params, required_params) #required params is the key required for an specific service
    required_params.all? { |key| params.key?(key) && params[key].present? }
  end

  def self.success_response(data = nil)
    { success: true, data:, status: 200 }
  end

  def self.fail_response(data, code = 403)
    {success: false, status: code, data: }
  end

end
