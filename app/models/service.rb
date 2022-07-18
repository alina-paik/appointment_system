# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :specialist_services
  has_many :users,  through: :specialist_services
  validates :name, presence: true,
            uniqueness: true,
            length: { maximum: 20 }
end
