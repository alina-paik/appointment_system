# frozen_string_literal: true

module ClientAppointments
  class FindAppointment < ApplicationService
    attr_reader :user_id, :id

    def initialize(user_id:, id:)
      @user_id = user_id
      @id = id
    end

    def call
      service_ids = Service.where(user_id: user_id).map { |n| n.id }
      ClientAppointment.find_by(service_id: service_ids, id: id)
    end
  end
end
