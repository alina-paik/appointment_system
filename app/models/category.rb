# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :services
  has_many :users,  through: :services
  validates :name, presence: true,
            uniqueness: true,
            length: { maximum: 20 }
end
