class HomeController < ApplicationController
    def index
        @latest = []
        @activities = []
        current_user.invites.each do |invite|
            invite.order.activities.each {|a| @activities.push(a)}
            if invite.order.status == 'waiting'
                @latest.push(invite.order)
            end
        end
        @activities = @activities.reverse()
        @latest = @latest.reverse()
    end
end