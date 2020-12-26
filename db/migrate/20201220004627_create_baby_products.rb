class CreateBabyProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :baby_products do |t|
      t.string :name
      t.integer :price
      t.string :product_type
      t.string :url
      t.belongs_to :user, null: false, foreign_key: true
      # t.belongs_to :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
