class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :integer do |t|
      t.text :content
      t.references :user, foreign_key: true, type: :integer, null: false
      t.references :post, foreign_key: true, type: :integer, null: false
      t.string :hash_id

      t.timestamps
    end
    add_index :comments, :hash_id, unique: true
  end
end
