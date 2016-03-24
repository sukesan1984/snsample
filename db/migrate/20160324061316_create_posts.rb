class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :comment, null: false
      t.column :restriction, :tinyint, null: false
      t.integer :group_id, null: false, default: 0
      t.integer :photo_id1, null: false, default: 0
      t.integer :photo_id2, null: false, default: 0
      t.integer :photo_id3, null: false, default: 0
      t.timestamps null: false
    end
  end
end
