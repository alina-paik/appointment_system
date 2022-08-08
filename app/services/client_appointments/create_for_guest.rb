module ClientAppointments
  class CreateForGuest < ApplicationService

    attr_reader :service_id, :client_name, :client_phone_number, :client_email

    def initialize(service_id:, client_name:, client_phone_number:, client_email:)
      @service_id = service_id
      @client_name = client_name
      @client_phone_number = client_phone_number
      @client_email = client_email
    end

    def call
      appointment = ClientAppointment.new(payload)
      if appointment.save
        { result: appointment }
      else
        { errors: appointment.errors }
      end
    end

    def payload
      {
        service_id: service_id,
        client_name: client_name,
        client_phone_number: client_phone_number,
        client_email: client_email,
        status: 'pending'
      }
    end
  end
end
