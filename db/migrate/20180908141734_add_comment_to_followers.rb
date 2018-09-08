class AddCommentToFollowers < ActiveRecord::Migration[5.2]
  def change
    add_column :followers, :comment, :string
  end
end
