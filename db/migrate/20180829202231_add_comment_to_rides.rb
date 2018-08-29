class AddCommentToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :comment, :string
  end
end
