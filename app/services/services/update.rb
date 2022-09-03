# frozen_string_literal: true

module Services
  class Update < ApplicationService
    attr_reader  :category_id, :name, :description, :duration, :price, :object

    def initialize(category_id:, name:, description:, duration:, price:, object:)
      @category_id = category_id
      @name = name
      @description = description
      @duration = duration
      @price = price
      @object = object
    end

    def call
      object.assign_attributes(payload)
      if object.save
        { result: object }
      else
        { errors: object.errors }
      end
    end

    def payload
      {
        category_id: category_id,
        name: name,
        description: description,
        duration: duration,
        price: price
      }
    end
  end
end
