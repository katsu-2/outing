class Category < ApplicationRecord
  has_many :posts
  # belongs_to :parent, class_name: :Category, optional: true
end
