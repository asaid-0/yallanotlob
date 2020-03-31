class User < ApplicationRecord
    has_many :items
    has_many :orders, through: :items
    has_many :orders
end
