# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :client_appointments
  # has_many :users,  through: :client_appointments
  validates :user_id, :category_id, :duration, :name, :description, :price, presence: true
  validates :duration, length: { in: 1..5 },
             numericality: true
  validates :description, length: { maximum: 500 }
end
