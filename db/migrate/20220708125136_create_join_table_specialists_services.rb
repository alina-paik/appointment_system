# frozen_string_literal: true

class CreateJoinTableSpecialistsServices < ActiveRecord::Migration[5.2]
  def change
    create_table :specialist_services do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.integer :duration, null: false, default: 0
      t.timestamps null: false
    end
    add_index :specialist_services, %i[user_id service_id], unique: true
  end
end
