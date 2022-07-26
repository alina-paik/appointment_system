# frozen_string_literal: true
#
# class ClientAppointment < ApplicationRecord
#    belongs_to :user
#    belongs_to :specialist_service
#   validates :user_id, :specialist_services_id, :from, :to, :status, presence: true
#   validates :status, inclusion: { in: %w(confirmed pending canceled declined completed)}
# end
# canceled - canceled by customers
# declined - declined by specialist
