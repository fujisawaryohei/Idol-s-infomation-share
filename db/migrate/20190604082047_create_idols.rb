class CreateIdols < ActiveRecord::Migration[5.2]
  def change
    create_table :idols, id: :integer do |t|
      t.references :user, foreign_key: true, type: :integer, null: false
      t.string :name
      t.string :hash_id

      t.timestamps
    end
    add_index :idols, :hash_id, unique: true
  end
end
