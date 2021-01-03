class User < ApplicationRecord
    has_many :baby_products, :dependent => :destroy
    has_many :reviews, :dependent => :destroy
    has_many :reviewed_baby_products, through: :reviews,
        source: :baby_products

    has_secure_password 
    # has_many :brands, through: :baby_products
    validates :username, presence: true 
    validates :email, presence: true, uniqueness: true 

end
