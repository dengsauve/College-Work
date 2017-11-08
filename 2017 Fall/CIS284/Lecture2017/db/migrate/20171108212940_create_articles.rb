class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.datetime :published_date
      t.boolean :published
      t.text :context
      t.string :avatar_url

      t.timestamps
    end
  end
end
