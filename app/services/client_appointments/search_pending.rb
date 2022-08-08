
module ClientAppointments
  class SearchPending < ApplicationService

    attr_reader :user_id, :page

    def initialize(user_id:, page:)
      @user_id = user_id
      @page = page
    end

    def call
      service_ids = Service.where(user_id: user_id).map{|n| n.id}
      appointments = ClientAppointment.where(service_id: service_ids, status: 'pending').page(page)
    end
  end
end
