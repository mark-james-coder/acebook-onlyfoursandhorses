class CreateWallpostcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :wallpostcomments do |t|
      t.text :content
      t.string :commenter
      t.references :wallpost
      t.timestamps
    end
  end
end
