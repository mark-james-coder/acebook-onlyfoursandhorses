class CreateWallposts < ActiveRecord::Migration[5.1]
  def change
    create_table :wallposts do |t|
      t.text :content
      t.references :user
      t.string :poster
      t.timestamps
    end
  end
end
