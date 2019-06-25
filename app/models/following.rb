class Following < ApplicationRecord
  belongs_to :following_id
  belongs_to :follower_id
end
