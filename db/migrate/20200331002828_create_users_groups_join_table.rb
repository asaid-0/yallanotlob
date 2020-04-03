class CreateUsersGroupsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :groups, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.index :user_id
      t.index :group_id
    end
    add_foreign_key :groups_users, :users
    add_foreign_key :groups_users, :groups
  end
end
