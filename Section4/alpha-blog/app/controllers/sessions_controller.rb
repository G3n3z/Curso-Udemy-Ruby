class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully";
      redirect_to user_path(user)
    else
      flash.now[:alert] = "There was something wrong"
      render "new"
    end
  end

  def new

  end

  def destroy
    session[:user_id] = nil
    p session[:user_id]
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
