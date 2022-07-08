# frozen_string_literal: true

class CreateJoinTableClientsAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :client_appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :specialist_services, index: true, foreign_key: true
      t.datetime :from, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :to, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.string :status, null: false, default: ""
      t.timestamps null: false
    end
  end
end
