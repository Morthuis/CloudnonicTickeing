class Api::V1::EventsController < ApplicationController

  before_action :authenticate_api_v1_user!, only: :create

  def index
    response = Api::V1::Events::Index.call
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def show
    response = Api::V1::Events::Show.call(params[:id])
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def create
    response = Api::V1::Events::Create.call(event_params, current_api_v1_user)
    render json: { success: response[:success], data: response[:data] }, status: response[:status]
  end

  def update

  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time, :ticket_price, :tickets_threshold)
  end

end
