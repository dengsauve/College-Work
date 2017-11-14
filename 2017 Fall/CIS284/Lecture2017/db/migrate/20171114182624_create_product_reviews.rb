class CreateProductReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reviews do |t|
      t.string :author
      t.text :comment
      t.integer :rating
      t.belongs_to :product, foreign_key: true

      t.timestamps
    end
  end
end
