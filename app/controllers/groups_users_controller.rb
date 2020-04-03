class GroupsUsersController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    if (@user.present? && @user != current_user)
      @selected_group = Group.find(params[:format])
      @selected_group.users << User.find_by(name: params[:name])
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy

    @selected_group = Group.find(params[:group_id])
    @selected_group.users.destroy( User.find(params[:id]) )

    redirect_back(fallback_location: root_path)
  end
end
