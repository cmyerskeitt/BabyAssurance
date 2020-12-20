class Brand < ApplicationRecord
    has_many :baby_products 
    has_many :reviews, through: :baby_products
    has_many :users, through: :baby_products 
end
