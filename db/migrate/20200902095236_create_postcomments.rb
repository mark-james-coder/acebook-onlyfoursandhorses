class CreatePostcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :postcomments do |t|
      t.text :content
      t.string :commenter
      t.references :post
      t.timestamps
    end
  end
end
