class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      redirect_to article_path(@article)
    end
    #Article.create(params[:article])

  end

  def new

  end

  def show
    #byebug
    @article = Article.find(params[:id])
  end
end