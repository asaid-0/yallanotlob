class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name
      t.string :restaurant
      t.integer :status, default: 0 #0 for waiting, 1 for finished, 2 for cancelled
      t.string :menu #menu image path
      t.timestamps
    end
  end
end
