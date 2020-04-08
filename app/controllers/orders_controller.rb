class OrdersController < ApplicationController
  def index
    # user orders
    @user_orders =  Order.where(user_id: current_user.id)
    # user invited-orders
    @user_invited_orders_ids = Invite.where("user_id = ?" , current_user.id).pluck(:order_id)
    @user_invited_orders = Order.where("id = ?" , @user_invited_orders_ids)
  end
  
  def join
    invitation = Invite.find(params[:invitation_id].to_i)
    if (invitation.user_id == current_user.id) && (invitation.order_status == "waiting")
      invitation.joined = true
      invitation.save()
      return redirect_to action: 'show', id: 1
    end
    redirect_back(fallback_location: root_path)    
  end

  def update
    @order = Order.find(params[:id])
    if params[:link] === "finish"
      @order.status = 1
      @order.save
      @message = "Your Order is Finished"
    else
      @order.status = 2
      @order.save
      @message = "Your Order is Cancelled"
    end
    flash.alert = @message
    redirect_back fallback_location: root_path
  end

  def new
    @order = current_user.orders.new
  end
  def create

    @order = current_user.orders.new(order_params)
    if @order.save
      # create invites for friends
      friends_params.each do |id|
        if @order.invites.where(user_id: id).empty? && current_user.id != id
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

  def notifications
    joined_friends = Invite.where(:order_id => current_user.orders.pluck(:id)).where(joined: true).order(updated_at: :desc)
    invitations = current_user.invites.where(joined: false)
    @notifications = joined_friends + invitations
    @notifications.sort_by &:updated_at
    @notifications.reverse!

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @notifications }
    end
  end
  

  def show
    @order = Order.find(params[:id].to_i)
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
