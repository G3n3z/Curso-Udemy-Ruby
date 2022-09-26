class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, length: {minimum: 6, maximum: 100}, presence: true
  validates :description,  presence: true, length: {minimum: 10, maximum: 1000}

end
