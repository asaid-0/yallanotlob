class Invite < ApplicationRecord
    belongs_to :user
    belongs_to :order

    # Virtual Attributes to be used in /notifications.json
    attribute :order_owner, :string
    attribute :owner_id, :integer
    attribute :invited_user, :string
    attribute :order_restaurant, :string
    attribute :order_status, :string

    def order_owner
        return Order.find(self.order_id).user.name
    end

    def owner_id
        return Order.find(self.order_id).user.id
    end

    def invited_user
        return User.find(self.user_id).name
    end
   
    def order_restaurant
        return Order.find(self.order_id).restaurant
    end

    def order_status
        return Order.find(self.order_id).status
    end


    def as_json(options = {})
        super(methods: [:order_owner, :invited_user, :order_restaurant, :order_status, :owner_id])
    end


end
