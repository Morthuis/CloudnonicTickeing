class Api::V1::TicketsController < ApplicationController
  rescue_from StandardError, with: :manage_general_error
  before_action :authenticate_api_v1_user!, only: %i[create update]
  respond_to :json

  def show
    response = Api::V1::Tickets::Show.call(params[:id])
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def tickets_list
    response = Api::V1::Tickets::TicketsList.call(params[:id])
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def create
    response = Api::V1::Tickets::Create.call(ticket_params)
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def update

  end

  private

  def ticket_params
    params.require(:ticket).permit(:buyer_name, :quantity, :event_id) if params[:ticket].present?
  end

  def manage_general_error(exception)
    render json: { error: exception.message }, status: :bad_request
  end

end
