#frozen_string_literal: true

class ClientAppointment < ApplicationRecord
   #belongs_to :user
   # TODO: add relation to user
   belongs_to :service
  validates :service_id, :client_email, :status, presence: true
  validates :client_name, presence: true, length: { maximum: 20 }
  validates :client_phone_number, presence: true,
            numericality: true,
            length: { in: 9..15 },
            format: { with: /\d[0-9]\)*/, message:"only positive number without spaces are allowed" }
  validates :status, inclusion: { in: %w(confirmed pending canceled declined completed)}
  validates_uniqueness_of :service_id, :scope => [:client_email], if: :status_pending?
  def status_pending?
    status == "pending"
  end
end
# canceled - canceled by customers
# declined - declined by specialist
