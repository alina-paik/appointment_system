# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :client_appointments
  # has_many :users,  through: :client_appointments
  validates :user_id, :category_id, :duration, :name, :descriprion, :price, presence: true
  validates :duration, length: { in: 1..5 },
             numericality: true
  validates :descriprion, length: { maximum: 500 }
end
