# frozen_string_literal: true

class ClientAppointmentsController < ApplicationController
  before_action :authenticate_user!, only: %i[index_pending show update]
  before_action :set_appointment, only: %i[show update]
  # POST /client_appointments
  def create
    result = ClientAppointments::CreateForGuest.call(**set_for_guest)
    if result[:result]
      appointment = result[:result]
      render json: appointment, status: :created, location: appointment
    else
      errors = result[:errors]
      render json: errors, status: :unprocessable_entity
    end
  end

  # GET client_appointments?page=3
  def index
    appointments = ClientAppointments::Search.call(user_id: current_user.id, page: params[:page], status: params[:status])
    render json: appointments
  end

  # GET client_appointments/pending?page=3
  # def index_pending
  #   appointments = ClientAppointments::SearchPending.call(user_id: current_user.id, page: params[:page])
  #   render json: appointments
  # end

  # GET client_appointments/:id
  def show
    if @appointment == nil
      render status: 404
    else
      render json: @appointment
    end
  end

  # PUT client_appontments/:id
  def update
    result = ClientAppointments::Update.call(**set_for_update.merge(object: @appointment))
    if result[:result]
      appointment = result[:result]
      render json: appointment
    else
      errors = result[:errors]
      render json: errors, status: :unprocessable_entity
    end
  end


  private
    def set_for_guest
      params.require(:client_appointment).permit(:service_id, :client_name, :client_phone_number, :client_email).to_h.symbolize_keys
    end

    def set_for_update
      params.require(:client_appointment).permit(:status, :from, :to).to_h.symbolize_keys
    end

    def set_appointment
      @appointment = ClientAppointments::FindAppointment.call(user_id: current_user.id, id: params[:id])
    end
end
