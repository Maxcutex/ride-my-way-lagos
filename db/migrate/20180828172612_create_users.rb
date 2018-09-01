# migration for Users
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      #t.string :email
      t.string :email,              null: false, default: ""

      t.boolean :is_active
      t.string :username
      t.string :password_digest
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
