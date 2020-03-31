class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.bigint :friend_id
      t.index :friend_id
      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
