# frozen_string_literal: true

module Categories
  class Search < ApplicationService
    attr_reader  :page

    def initialize(page:)
      @page = page
    end

    def call
      Category.page(page)
    end
  end
end
