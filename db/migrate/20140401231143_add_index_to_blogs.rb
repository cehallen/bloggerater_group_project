class AddIndexToBlogs < ActiveRecord::Migration
  def change
    add_index :blogs, :url, unique: true
  end
end
