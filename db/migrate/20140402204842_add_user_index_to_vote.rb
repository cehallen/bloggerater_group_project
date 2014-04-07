class AddUserIndexToVote < ActiveRecord::Migration
  def change
    add_index :votes, :user_id, unique: true
    add_index :votes, :review_id, unique: true
  end
end
