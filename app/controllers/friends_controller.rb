class FriendsController < ApplicationController
    def index
      @friends = current_user.friends
    end
  
    def create

        if (params[:email].present?)
          @friend = User.find_by(email: params[:email])
          if (@friend.present?)
            @new_friendship= Friendship.new;
            @new_friendship.user_id = current_user.id
            @new_friendship.friend_id = User.find_by(email: params[:email]).id
            @new_friendship.save 
          else
            flash[:friend_error] = "Friend Email doesnt exist"
          end
        else
          flash[:friend_error] = "You didnt type any Email Address"
        end
      redirect_back(fallback_location: root_path)
    end
  
    def edit
    end
  
    def destroy
      @Friendship = Friendship.find_by(friend_id: params[:id])
      @Friendship.destroy
      redirect_back(fallback_location: root_path)
    end
  
    def show
    end
  
  end
  