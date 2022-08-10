# frozen_string_literal: true

module ClientAppointments
  class Update < ApplicationService
    attr_reader :status, :from, :to, :object

    def initialize(status:, from:, to:, object:)
      @status = status
      @from = from
      @to = to
      @object = object
    end

    def call
      payload =
              if status.eql?("confirmed")
                build_payload_to_confirmed
              else
                build_payload
              end

      object.assign_attributes(payload)
      if object.save
        { result: object }
      else
        { errors: object.errors }
      end
      end

    def build_payload_to_confirmed
      {
        status: "confirmed",
        from: from,
        to: to
      }
    end

    def build_payload
      {
        status: status
      }
    end
  end
end
