class GroupsUsersController < ApplicationController
  def create
    if (params[:name].present?)
      # @user = User.find_by(name: params[:name])
      # p @user
    end
    # p params
    redirect_back(fallback_location: root_path)
  end

  def destroy
    redirect_back(fallback_location: root_path)
  end
end
