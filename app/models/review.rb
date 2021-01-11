class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_product

  validates :rating, numericality: {less_than_or_equal_to: 5, greater_than: 0}
  validates :description, presence: true
  

end
