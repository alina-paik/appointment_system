# frozen_string_literal: true

class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :descriprion, :duration, :price, :user_id
  belongs_to :category
end
