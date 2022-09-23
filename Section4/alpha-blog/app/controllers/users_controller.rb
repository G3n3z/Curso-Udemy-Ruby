class UsersController < ApplicationController
  def new
    @user = User.new;
  end

  def create
    @user = User.new(user_params_to_signup)
    if @user.save
      flash[:notice] = "Welcome to Alpha Blog #{user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      @user.email = ""
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def show

  end

  private
  def user_params_to_signup
    params.require(:user).permit(:email, :username, :password)
  end


end
