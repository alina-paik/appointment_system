# frozen_string_literal: true

class AddToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :phone_number, null: false, default: ""
    end
    add_index :users, :phone_number, unique: true, name: "unique_user_phone_number"
  end
end
