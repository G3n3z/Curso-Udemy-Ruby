class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      name = params[:friend]
      @friends = User.search(name)
      @friends = current_user.except_current_user(@friends) if @friends
      #@friends.delete(current_user) if @friends
      if @friends
        respond_to do |format|
          format.js{render partial: "users/friend_result"}
        end
      else
        respond_to do |format|
          flash[:alert] = "Couldn't find user"
          format.js{render partial: "users/friend_result"
          }
        end
      end
    else
      respond_to do |format|
        flash[:alert] = "Please enter a friend name or email to search"
        format.js{render partial: "users/friend_result"
        }
      end
    end
  end

  def show
    friend_id = params[:id]
    @user = User.find(friend_id)
    @tracked_stocks = @user.stocks
    unless @user
      flash[:error] = "Problem with finding User Profile"
      redirect_to root_path
    end

  end

end
