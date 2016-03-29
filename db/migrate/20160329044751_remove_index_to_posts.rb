class RemoveIndexToPosts < ActiveRecord::Migration
  def change
    remove_index :posts, [:user_id, :restriction, :created_at]
    add_index :posts, [:user_id, :created_at]
  end
end
