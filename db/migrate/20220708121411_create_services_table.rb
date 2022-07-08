# frozen_string_literal: true

class CreateServicesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name, null: false, default: ""
      t.timestamps null: false
    end
  end
end
