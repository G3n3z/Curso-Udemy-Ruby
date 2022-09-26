class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def create

    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to article_path(@article)
    else
      render 'articles/new'
    end
    #Article.create(params[:article])

  end

  def new
    unless logged_in?
      flash.now[:alert] = "You need be logged in to create a new article"
      render "sessions/new"
    end
    @article =  Article.new
  end

  def show
    #byebug
  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article

    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end

end