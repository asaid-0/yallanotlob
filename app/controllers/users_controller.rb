class UsersController < ApplicationController
    require 'json'
    
    def index
        @user = Order.find_by(id: params[:id]).user if Order.find_by(id: params[:id]) 
        # render :index
    end
    

end
