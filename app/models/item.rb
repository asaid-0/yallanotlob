class Item < ApplicationRecord
    validates :user_id, :item, :quantity, :price,:comment, :order_id, presence: true
    belongs_to :user
    belongs_to :order
end
