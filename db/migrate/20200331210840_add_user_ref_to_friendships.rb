class AddUserRefToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_reference :friendships, :user, null: false, foreign_key: true
  end
end
