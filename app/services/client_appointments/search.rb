module ClientAppointments
  class Search < ApplicationService
    attr_reader :user_id, :status, :page

    def initialize(user_id:, status:, page:)
      @user_id = user_id
      @status = status
      @page = page
    end

    def call
      @service_ids = Service.where(user_id: user_id).map { |n| n.id }
      ClientAppointment.where(payload).page(page)
    end

    def payload
      {}.tap do |object|
        object[:status] = status if status
        object[:service_id] = @service_ids
      end
    end
  end
end
