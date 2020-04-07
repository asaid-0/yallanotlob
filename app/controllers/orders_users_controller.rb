class OrdersUsersController < ApplicationController


    def destroy
        @invite= Invite.find(params[:id])
        @invite.destroy
        redirect_back(fallback_location: root_path)
    end

end
