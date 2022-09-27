class SessionsController < ApplicationController
  before_action :logged_in_redirect, only:[:new, :create]
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
    session[:user_id] = nil
    flash[:success] = "you have successfully logged out"
    redirect_to login_path
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)

  end
  
  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
