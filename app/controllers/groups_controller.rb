class GroupsController < ApplicationController
  def index
    @groups = Group.all
    if (params[:id].present?)
      p params
      @group = Group.find(params[:id])
      p @group
    end

  end

  def create
    # p params[:name]
    @group= Group.new;
    @group.name = params[:name]
    @group.description = params[:name]
    @group.user_id = 1
    @group.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @id = Group.find(params[:id])
    redirect_to groups_path(:id => @id)
    # redirect_to :groups
    # redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
  end

end
