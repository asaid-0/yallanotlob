class OrdersController < ApplicationController
  def index
  end

  def new
    @order = current_user.orders.new
  end
  def create

    @order = current_user.orders.new(order_params)
    if @order.save
      # create invites for friends
      friends_params.each do |id|
        if @order.invites.where(user_id: id).empty?
          @add_invite = @order.invites.new
          @add_invite.user_id = id
          @add_invite.save();
        end
      end
      # create invites for groups
      groups_params.each do |id|
        Group.find(id).users.each do |user|
          if @order.invites.where(user_id: user.id).empty?
            @add_invite = @order.invites.new
            @add_invite.user_id = user.id
            @add_invite.save();
          end
        end
      end
      redirect_to orders_path, notice: "The #{@order.name} Order from #{@order.restaurant} has been created."
    else
        render "new"
    end
  end
  def searchGroups
    @groups = current_user.groups.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @groups }
    end
    
  end
  def searchFriends
    @users = current_user.friends.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users }
    end
  end

  private
      def order_params
        params.require(:order).permit(:name, :menu, :restaurant)
      end

      def friends_params
        if params['friends']
          return params.require(:friends)
        end
        return []
      end

      def groups_params
        if params['groups']
          return params.require(:groups)
        end
        return []
      end

end
