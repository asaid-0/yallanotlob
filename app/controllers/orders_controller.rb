class OrdersController < ApplicationController
  def index
  end

  def new
    @order = User.first.orders.new
  end
  def create

    @order = User.first.orders.new(order_params)
    if @order.save
        redirect_to orders_path, notice: "The #{@order.name} Order from #{@order.restaurant} has been created."
    else
        render "new"
    end
    @order.save
  end
  def searchGroups
    # @groups = User.all
    @groups = User.first.groups.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @groups }
    end
    
  end
  def searchFriends
    @users = User.all
    @users = User.first.friends.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @users }
    end
    
  end

  private
      def order_params
        params.require(:order).permit(:name, :menu, :restaurant)
      end

end
