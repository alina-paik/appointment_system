# frozen_string_literal: true

class Service < ApplicationRecord
  validates :name, presence: true,
            length: { maximum: 20 }
end
