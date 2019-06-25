class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :integer do |t|
      t.string :name
      t.text :profile
      t.string :image_file
      t.string :hash_id

      t.timestamps
    end
    add_index :users, :hash_id, unique: true
  end
end
