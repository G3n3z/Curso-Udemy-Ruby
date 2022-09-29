class FriendshipsController < ApplicationController
  def create
    friend_id = friendship_params
    friend = User.find(friend_id)
    if friend
      current_user.friends << friend
      flash[:notice] = "Following user"
      redirect_to my_friends_path
    else
      flash[:alert] = "There was something wrong with the tracking request"
      render "users/my_friends"
    end
  end

  def destroy
    friend_id = params[:id]
    if current_user.eliminate_friend?(friend_id)
      flash[:notice] = "Stopped following"
      redirect_to my_friends_path
    else
      flash.now[:error] = "Its not possible do that action"
      render "users/my_friends"
    end

  end

  private
  def friendship_params
    params.require(:friend)
  end
end
