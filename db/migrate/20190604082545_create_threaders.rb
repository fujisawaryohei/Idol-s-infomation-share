class CreateThreaders < ActiveRecord::Migration[5.2]
  def change
    create_table :threaders, id: :integer do |t|
      t.string :title
      t.references :user, foreign_key: true, type: :integer
      t.string :hash_id

      t.timestamps
    end
    add_index :threaders, :hash_id, unique: true
  end
end
