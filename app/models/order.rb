class Order < ApplicationRecord
    enum status: [ :waiting, :finished, :cancelled ]
    has_many :items
    has_many :users, through: :items
    belongs_to :user
end
