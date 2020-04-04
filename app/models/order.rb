class Order < ApplicationRecord
    enum status: [ :waiting, :finished, :cancelled ]
    mount_uploader :attachment, AttachmentUploader
    validates :name, :restaurant, :menu, presence: true
    has_many :items
    has_many :users, through: :items
    belongs_to :user
end
