class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :review_text
      t.integer :rating
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

# Review name:string review_text:text rating:integer restaurant:references