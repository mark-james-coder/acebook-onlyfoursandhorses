class AddLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :likes, :integer
  end
end
