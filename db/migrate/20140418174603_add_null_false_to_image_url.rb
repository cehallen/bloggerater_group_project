class AddNullFalseToImageUrl < ActiveRecord::Migration
  def up
    change_column :blogs, :image_url, :string, null: false
  end

  def down
    change_column :blogs, :image_url, :string
  end
end
