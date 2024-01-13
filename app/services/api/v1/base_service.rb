class Api::V1::BaseService

  def self.required_fields_present?(params, required_keys)
    return false unless params

    required_keys.all? { |key| params.key?(key) && params[key].present? }
  end

  def self.missing_params(params, required_keys)
    return required_keys unless params

    required_keys.reject { |key| params.key?(key) && params[key].present? }
  end

  def self.success_response(data = nil)
    { success: true, data:, status: 200 }
  end

  def self.fail_response(data, code = 403)
    {success: false, status: code, data: }
  end

end
