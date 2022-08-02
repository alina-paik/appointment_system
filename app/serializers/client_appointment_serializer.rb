class ClientAppointmentSerializer < ActiveModel::Serializer
  attributes :id, :service_id, :client_name, :client_phone_number, :client_email, :status, :from, :to
  belongs_to :service
end
