class AddOrderRefToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :order, null: false, foreign_key: true
  end
end
