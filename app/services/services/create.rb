# frozen_string_literal: true

module Services
  class Create < ApplicationService
    attr_reader :user_id, :category_id, :name, :description, :duration, :price

    def initialize(user_id:, category_id:, name:, description:, duration:, price:)
      @user_id = user_id
      @category_id = category_id
      @name = name
      @description = description
      @duration = duration
      @price = price
    end

    def call
      service = Service.new(payload)
      if service.save
        { result: service }
      else
        { errors: service.errors }
      end
    end

    def payload
      {
        user_id: user_id,
        category_id: category_id,
        name: name,
        description: description,
        duration: duration,
        price: price
      }
    end
  end
end
