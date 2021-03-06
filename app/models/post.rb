class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :folder_posts, dependent: :destroy
  has_many :folders, through: :folder_posts
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  #validation
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :answer, presence: true

  scope :recent, -> { order('created_at desc') }

  def self.search(search)
    if search
      where('title LIKE :search or content LIKE :search', { search: "%#{search}%"})
    else
      all
    end
  end
end
