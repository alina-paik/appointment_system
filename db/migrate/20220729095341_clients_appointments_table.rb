# frozen_string_literal: true

class ClientsAppointmentsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :client_appointments do |t|
      t.references :service, index: true, foreign_key: true
      t.string :client_name, null: false, default: ""
      t.string :client_phone_number, null: false, default: ""
      t.string :client_email, null: false, default: ""
      t.datetime :from, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :to, default: -> { "CURRENT_TIMESTAMP" }
      t.string :status, null: false, default: ""
      t.timestamps null: false
    end
  end
end
