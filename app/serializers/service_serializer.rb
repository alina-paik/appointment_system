class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :descriprion, :duration, :price
  belongs_to :category
end
