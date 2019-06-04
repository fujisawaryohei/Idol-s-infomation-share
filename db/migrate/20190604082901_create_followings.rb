class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings, id: :integer do |t|
      t.integer :following_id
      t.integer :follower_id
    end
      add_index :followings, [:follower_id, :following_id], unique: true
  end
end
