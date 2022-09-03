class ChangeServices < ActiveRecord::Migration[5.2]
  def change
    rename_column(:services, :descriprion, :description)
  end
end
