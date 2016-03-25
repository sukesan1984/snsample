class ChangeDatatypePostsOfPosts < ActiveRecord::Migration
  def change
    change_column :posts, :comment, :text
  end
end
