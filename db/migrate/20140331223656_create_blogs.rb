class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :url, null: false, unique: true
      t.string :image_url
      t.text :description
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
