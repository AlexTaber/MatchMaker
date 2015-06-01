class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.text    :status, default: "pending"

      t.timestamps null: false
    end
  end
end
