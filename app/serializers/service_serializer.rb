# frozen_string_literal: true

class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration, :price, :user_id
  belongs_to :category
end
