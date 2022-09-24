class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new;
  end

  def create
    @user = User.new(user_params_to_signup)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Alpha Blog #{@user.username}, you have successfully signed up"
      redirect_to articles_path
    else
      @user.email = ""
      render "new"
    end
  end

  def edit
    unless @user
      redirect_to root_path
    end
  end

  def update
    p params
    if @user.update(user_params_to_signup)
      flash[:notice] = "Your account informations was successfully updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    unless @user
      redirect_to root_path
    end

  end

  private
  def user_params_to_signup
    params.require(:user).permit(:email, :username, :password)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end


end
