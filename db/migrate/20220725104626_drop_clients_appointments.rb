class DropClientsAppointments < ActiveRecord::Migration[5.2]
  def up
    drop_table :client_appointments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
