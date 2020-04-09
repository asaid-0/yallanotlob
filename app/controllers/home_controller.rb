class HomeController < ApplicationController
    def index
        @latest = []
        @activities = []
        current_user.invites.each do |invite|
            if Friendship.where(user_id: current_user.id).where(friend_id: invite.order.user.id).exists?
                invite.order.activities.each {|a| @activities.push(a)}
            end 
            if invite.order.status == 'waiting'
                @latest.push(invite.order)
            end
        end
        @activities = @activities.reverse()
        @latest = @latest.reverse()
    end
end