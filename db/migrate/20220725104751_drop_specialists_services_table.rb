# frozen_string_literal: true

class DropSpecialistsServicesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :specialist_services
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
