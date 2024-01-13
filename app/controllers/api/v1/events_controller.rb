class Api::V1::EventsController < ApplicationController
  rescue_from StandardError, with: :manage_general_error
  respond_to :json

  before_action :authenticate_api_v1_user!, only: %i[create update]

  def index
    response = Api::V1::Events::Index.call
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def show
    response = Api::V1::Events::Show.call(params[:id])
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def create
    response = Api::V1::Events::Create.call(event_params, current_api_v1_user.id)
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def update
    response = Api::V1::Events::Update.call(event_params, params[:id].to_i, current_api_v1_user)
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :ticket_price, :tickets_threshold) if params[:event].present?
  end

  def manage_general_error(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
