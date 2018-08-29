class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :start_location
      t.string :end_location
      t.boolean :is_active
      t.integer :rider_count
      t.date :date_ride
      t.boolean :is_completed
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
