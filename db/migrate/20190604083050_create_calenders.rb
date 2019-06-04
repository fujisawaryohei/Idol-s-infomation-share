class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders, id: :integer do |t|
      t.references :user, foreign_key: true, type: :integer
      t.text :content
      t.datetime :datetime

      t.timestamps
    end
  end
end
