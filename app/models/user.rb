class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

         
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    end
  end



    has_many :invites
    has_many :orders, through: :invites

    has_many :items
    has_many :orders, through: :items
    has_many :orders
    
    has_and_belongs_to_many :subscribes, :class_name => "Group"
    has_many :groups, dependent: :destroy
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :received_friends, through: :received_friendships, source: 'user'
    
end

