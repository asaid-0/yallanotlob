class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item
      t.integer :quantity
      t.decimal :price, precision: 5, scale: 2
      t.string :comment
      t.timestamps
    end
  end
end
