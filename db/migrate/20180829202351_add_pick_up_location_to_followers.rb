# migration for modifying followers
class AddPickUpLocationToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :pick_up_location, :string
  end
end
