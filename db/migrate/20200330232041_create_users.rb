class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.string :password_digest
      t.timestamps
    end
  end
end
