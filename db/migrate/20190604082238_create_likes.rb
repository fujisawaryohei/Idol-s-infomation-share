class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes, id: :integer do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :post, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
