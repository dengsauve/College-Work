class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :length

      t.timestamps
    end
  end
end
