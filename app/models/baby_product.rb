class BabyProduct < ApplicationRecord
  belongs_to :user
  # belongs_to :brand
  has_many :reviews 
  has_many :users, through: :reviews
  validates :name, :price, :product_type, :image, presence: true 
end
