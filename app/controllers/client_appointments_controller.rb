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

  # GET client_appointments/pending?page=3

  def index_pending
    appointments = ClientAppointments::SearchPending.call(user_id: current_user.id, page: params[:page])
    render json: appointments
  end

  # GET client_appointments/:id
  def show
    service_ids = Service.where(user_id: current_user.id).map{|n| n.id}
    appointment = ClientAppointment.find_by(service_id: service_ids, id: params[:id])
    if appointment == nil
      render status: 404
    else
      render json: appointment
    end
  end

  # PUT client_appontments/:id
  def update
    params = set_for_update
    if @appointment.update(params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end


  private

  # def set_for_current_user
  #   params.require(:client_appointment).permit(:service_id).merge(user_id: current_user.id,
  #     name: current_user.name, phone_number: current_user.phone_number, email: current_user.email)
  # end

  def set_for_guest
    params.require(:client_appointment).permit(:service_id, :client_name, :client_phone_number, :client_email).to_h.symbolize_keys
  end

  def set_for_update
    if params[:client_appointment][:status] == 'confirmed'
      params.require(:client_appointment).permit(:status, :from, :to)
    else
      params.require(:client_appointment).permit(:status)
    end
  end

  def set_appointment
    @appointment = ClientAppointment.find_by(id: params[:id])
  end
end
