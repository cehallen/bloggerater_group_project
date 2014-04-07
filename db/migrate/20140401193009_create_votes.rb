class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote, null: false
      t.integer :review_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
