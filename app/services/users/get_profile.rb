
module Users
  class GetProfile < ApplicationService
    attr_reader :id

    def initialize(id:)
      @id = id
    end

    def call
      User.find_by(id: id)
    end
  end
end
