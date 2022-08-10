# frozen_string_literal: true

module Services
  class Search < ApplicationService
    attr_reader :user_id, :page

    def initialize(user_id:, page:)
      @user_id = user_id
      @page = page
    end

    def call
      Service.where(user_id: user_id).page (page)
    end
  end
end
