class Article < ApplicationRecord
  validates :title, length: {minimum: 6, maximum: 100}, presence: true
  validates :description,  presence: true, length: {minimum: 10, maximum: 1000}

end
