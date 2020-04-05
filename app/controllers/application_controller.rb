class ApplicationController < ActionController::Base
    before_action :require_login
   
    private
   
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to :new_user_session
      end
    end
end