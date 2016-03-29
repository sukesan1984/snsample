class AddUserIdAndRestrictionIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :restriction
    add_index :posts, [:user_id, :restriction, :created_at]
  end
end
