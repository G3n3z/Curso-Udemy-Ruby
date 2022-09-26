class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_username(params[:session][:username])
    if !user
      flash.now[:error] = "Username dont exists"
      render "new"
    end
    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "you have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "Something is bad with your credentials"
      render "new"
    end

  end

  def destroy
    session[:id] = nil
    flash[:success] = "you have successfully logged out"
    redirect_to login_path
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)

  end

end
