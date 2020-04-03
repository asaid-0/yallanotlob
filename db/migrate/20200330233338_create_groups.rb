class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name, limit:50, unique: true, null: false
      t.references :user, foreign_key: true 
      t.text :description, null: false
      t.timestamps
    end
  end
end
