class CreateThreadComments < ActiveRecord::Migration[5.2]
  def change
    create_table :thread_comments, id: :integer do |t|
      t.text :comment
      t.references :user, foreign_key: true, type: :integer
      t.references :threader, foreign_key: true, type: :integer
      t.string :hash_id

      t.timestamps
    end
    add_index :thread_comments, :hash_id, unique: true
  end
end
