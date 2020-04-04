class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    if (current_user.groups.exists?(params[:group_id]))
      @group = Group.find_by(id: params[:group_id]) if Group.find_by(id: params[:group_id]) 
    end

  end

  def create
    if (params[:name].present?)
    @new_group= Group.new;
    @new_group.name = params[:name]
    @new_group.description = params[:name]
    @new_group.user_id = current_user.id
    @new_group.save
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    if current_user.groups.exists?(params[:id])
      @group_id = Group.find(params[:id])
      redirect_to groups_path(:group_id => @group_id)
    else
      redirect_back(fallback_location: root_path)
    end  
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
  end

end
