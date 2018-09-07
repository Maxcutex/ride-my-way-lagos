class DropRoles < ActiveRecord::Migration[5.2]
  def up
    drop_table :roles
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
