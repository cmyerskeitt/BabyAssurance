class User < ApplicationRecord
    has_many :baby_products
    has_many :reviews
    has_many :reviewed_baby_products, through :reviews
	    source: :baby_product
end
