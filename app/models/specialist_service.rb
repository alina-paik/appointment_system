# frozen_string_literal: true

class SpecialistService < ApplicationRecord
   belongs_to :user
   belongs_to :service
   has_many :client_appointments
   #has_many :users,  through: :client_appointments
  validates :user_id, :service_id, :duration, presence: true
  validates :duration, length: { in: 1..5 },
             numericality: true
end
