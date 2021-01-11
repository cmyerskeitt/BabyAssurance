class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_product

  validates :rating, numericality: {less_than_or_equal_to: 5, greater_than: 0}
  validates :description, presence: true
  
 #this is a class method/must be self.most_reviewed
  def self.most_reviewed
    The class (review) where review count is max 
    
  end 
end
