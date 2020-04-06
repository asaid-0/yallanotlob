class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :text
      t.timestamps
    end
    add_reference :activities, :order, null: false, foreign_key: true
  end
end