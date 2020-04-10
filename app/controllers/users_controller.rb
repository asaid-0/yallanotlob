class UsersController < ApplicationController
    require 'json'
    
    def index
        @user = User.find_by(id: params[:id]) if User.find_by(id: params[:id]) 
        # render :index
    end
    

end
