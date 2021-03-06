class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :hash_id, presence: true

  mount_uploader :image_file, ImageUploader
end
