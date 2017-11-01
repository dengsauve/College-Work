class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity_on_hand
      t.decimal :selling_price
      t.decimal :cost
      t.decimal :shipping_weight
      t.string :image_thumbnail
      t.string :image_full

      t.timestamps
    end
  end
end
