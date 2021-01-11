class BabyProduct < ApplicationRecord
  belongs_to :user
  # belongs_to :brand
  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews
  validates :name, :price, :product_type, :url, presence: true 
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  scope :alpha, -> { order(:name) }
end

