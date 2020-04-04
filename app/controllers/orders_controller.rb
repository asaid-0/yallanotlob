class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end
  def create
    
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
