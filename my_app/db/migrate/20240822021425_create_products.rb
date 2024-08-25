class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string :product_name
      t.string :description
      t.integer :price
      t.float :rating
      t.integer :quantity
	  t.string :image_name

      t.timestamps
    end
  end
end
