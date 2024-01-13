class Api::V1::Events::Index < Api::V1::BaseService

  def self.call
    success_response(Event.all)
  end
end
