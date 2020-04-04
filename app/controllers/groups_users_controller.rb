class GroupsUsersController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    
    if (@user.present? && current_user.friends.exists?(@user.id))
      @selected_group = Group.find(params[:format])
      if @selected_group.users.exists?(@user.id)
          flash[:friend_error] = "Friend already in group"
      else
          @selected_group.users << User.find_by(name: params[:name])
      end
    else
      flash[:friend_error] = "Friend not found"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy

    @selected_group = Group.find(params[:group_id])
    @selected_group.users.destroy( User.find(params[:id]) )

    redirect_back(fallback_location: root_path)
  end
end
