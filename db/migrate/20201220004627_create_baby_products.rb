class CreateBabyProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :baby_products do |t|
      t.string :name
      t.integer :price
      t.string :type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
