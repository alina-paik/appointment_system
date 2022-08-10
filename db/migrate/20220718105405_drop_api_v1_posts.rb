# frozen_string_literal: true

class DropApiV1Posts < ActiveRecord::Migration[5.2]
  def up
    drop_table :api_v1_posts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
