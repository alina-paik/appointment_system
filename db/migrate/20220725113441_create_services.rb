class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :descriprion, null: false, default: ""
      t.integer :duration, null: false, default: 0
      t.integer :price, null: false, default: 0
      t.timestamps null: false
    end
  end
end
