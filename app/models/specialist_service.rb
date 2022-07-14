# frozen_string_literal: true

class SpecialistService < ApplicationRecord
  validates :user_id, :service_id, :duration, presence: true
  validates :duration, length: { in: 1..5 },
             numericality: true
end
