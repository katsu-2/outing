class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :folder_posts, dependent: :destroy
  has_many :folders, through: :folder_posts
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  scope :recent, -> { order('created_at desc') }
end
