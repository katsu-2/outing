class Folder < ApplicationRecord
  has_many :folder_posts, dependent: :destroy
  has_many :posts, through: :folder_posts
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
end
