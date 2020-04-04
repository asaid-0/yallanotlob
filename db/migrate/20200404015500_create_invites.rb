class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.boolean :joined, null: false, default: false
      t.timestamps
    end
  end
end
