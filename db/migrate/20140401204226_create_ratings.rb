class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating, null: false
      t.integer :rater_id, null: false
      t.integer :blog_id, null: false

      t.timestamps
    end
  end
end
