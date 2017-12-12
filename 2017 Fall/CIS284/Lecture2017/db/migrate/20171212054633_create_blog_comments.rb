class CreateBlogComments < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_comments do |t|
      t.string :author
      t.text :content
      t.string :avatar
      t.integer :rating

      t.timestamps
    end
  end
end
