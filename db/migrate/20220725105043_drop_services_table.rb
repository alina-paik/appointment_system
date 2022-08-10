# frozen_string_literal: true

class DropServicesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :services
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
