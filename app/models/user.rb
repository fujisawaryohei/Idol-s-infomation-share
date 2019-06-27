class User < ApplicationRecord
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 20}

  validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }

  validates :hash_id, presence: true

  has_many :posts, dependent: :destroy

  has_many :threaders, dependent: :destroy

  has_many :threadComments, dependent: :destroy

  has_many :active_relationships, foreign_key: "follower_id", class_name: "Following", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following

  has_many :passive_relationships, foreign_key: "following_id", class_name: "Following", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest,nil)
  end

  def following?(other_user)
    !active_relationships.find_by(following_id: other_user.id).nil? ? true : false
  end

  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end
end
