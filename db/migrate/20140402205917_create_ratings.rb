class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rater_id, null: false
      t.integer :blog_id, null: false
      t.integer :blog_rating, null: false

      t.timestamps
      t.index [:rater_id, :blog_id], unique: true
    end
  end
end
