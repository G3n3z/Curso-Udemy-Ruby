class ChatroomController < ApplicationController

  def index
    unless logged_in?
      redirect_to login_path
    end
    @messages = Message.custom_display
    @message = Message.new
  end


end
