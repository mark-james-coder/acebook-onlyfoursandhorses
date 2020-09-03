class AddWallpostLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :wallposts, :likes, :integer
  end
end
