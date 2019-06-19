class Threader < ApplicationRecord
  belongs_to :user ,dependent: :destroy
  validates :title, presence: true
  validates :title, length: { maximum: 30 }
end
