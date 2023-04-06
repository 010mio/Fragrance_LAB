class Public::ArticlesController < ApplicationController
  before_action :authenticate_customer!, only: %i(new create)

  def new
    @article = Article.new
  end

  def create
    @article = current_customer.articles.new(article_params)
    @article.save
    redirect_to '/articles'
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    redirect_to article_path(article.id)  
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to '/articles'
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :image, :body)
  end
end
