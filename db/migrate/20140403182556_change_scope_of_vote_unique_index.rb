class ChangeScopeOfVoteUniqueIndex < ActiveRecord::Migration
  def change

    remove_index :votes, column: :user_id
    remove_index :votes, column: :review_id
    add_index :votes, [:user_id, :review_id], unique: true

  end
end
