class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, id: :integer do |t|
      t.text :content
      t.string :image_file
      t.references :user, foreign_key: true, type: :integer
      t.string :hash_id

      t.timestamps
    end
    add_index :posts, :hash_id, unique: true
  end
end
