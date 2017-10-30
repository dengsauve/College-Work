class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :location
      t.string :cuisine
      t.decimal :low_price_range
      t.decimal :high_price_range

      t.timestamps
    end
  end
end
