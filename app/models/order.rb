class Order < ApplicationRecord
    enum status: [ :waiting, :finished, :cancelled ]
    mount_uploader :menu, AttachmentUploader
    validates :name, :restaurant, :menu, presence: true
    has_many :items
    has_many :users, through: :items

    has_many :invites
    has_many :users, through: :invites

    belongs_to :user
end
