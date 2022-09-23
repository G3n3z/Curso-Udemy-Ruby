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
    @user = User.find_by_id(params[:id])
    unless @user
      redirect_to root_path
    end



  end

  def update
    @user = User.find_by_id(params[:id])
    p params
    if @user.update(user_params_to_signup)
      flash[:notice] = "Your account informations was successfully updated"
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    unless @user
      redirect_to root_path
    end

  end

  private
  def user_params_to_signup
    params.require(:user).permit(:email, :username, :password)
  end


end
