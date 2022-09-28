class UsersController < ApplicationController

  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      name = params[:friend]
      @friend = current_user.friends.where(email: name).first
      name = name.split(' ')
      if name.length == 1
        @friend = current_user.friends.where("first_name = ? or last_name = ?", name[0], name[0]).first
      elsif name.length > 1
        @friend = current_user.friends.where("first_name = ? or last_name = ? ", name[0], name[1]).first
      end

      if @friend
        respond_to do |format|
          format.js{render partial: "users/friend_result"}
        end
      else
        respond_to do |format|
          flash[:alert] = "Couldn't find user"
          format.js{render partial: "users/friend_result"}
        end
      end
    else
      respond_to do |format|
        flash[:alert] = "Please enter a symbol"
        format.js{render partial: "users/friend_result"}
      end
    end
  end
end
