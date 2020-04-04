class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_many :items
    has_many :orders, through: :items
    has_many :orders

    has_many :invites
    has_many :orders, through: :invites

    has_and_belongs_to_many :subscribes, :class_name => "Group"
    has_many :groups, dependent: :destroy
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :received_friends, through: :received_friendships, source: 'user'
    
end
