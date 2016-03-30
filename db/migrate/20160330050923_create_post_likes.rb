class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
