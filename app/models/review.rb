class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_product
end
