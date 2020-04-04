class AddReferencesToInvites < ActiveRecord::Migration[6.0]
  def change
    add_reference :invites, :order, null: false, foreign_key: true
    add_reference :invites, :user, null: false, foreign_key: true
  end
end
