class ClientAppointmentsController < ApplicationController

  # POST /clients_appointments
  def create
    appointment =
    if current_user
      # init_pending_appointment(set_for_current_user)
      init_pending_appointment(set_for_guest)
    else
      init_pending_appointment(set_for_guest)
    end

    if appointment.save
      render json: appointment, status: :created, location: appointment
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end


  private

  def init_pending_appointment(attributes)
    ClientAppointment.new(attributes.merge(status: "pending"))
  end

  def set_for_current_user
    params.require(:client_appointment).permit(:service_id).merge(user_id: current_user.id,
      name: current_user.name, phone_number: current_user.phone_number, email: current_user.email)
  end

  def set_for_guest
    params.require(:client_appointment).permit(:service_id, :client_name, :client_phone_number, :client_email)
  end
end
