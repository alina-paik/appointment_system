# frozen_string_literal: true

module Services
  class FindService < ApplicationService
    attr_reader :user_id, :id

    def initialize(user_id:, id:)
      @user_id = user_id
      @id = id
    end

    def call
      Service.find_by(user_id: user_id, id: id)
    end
  end
end
