# migration for followers
class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.boolean :will_ride
      t.references :ride, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
