class Public::ArticlesController < ApplicationController
  before_action :authenticate_customer!, only: %i(new create)
  before_action :set_q, only: [:index, :search]

  def new
    @sidebar = current_customer
    @article = Article.new
  end

  def create
    @sidebar = current_customer
    @article = current_customer.articles.new(article_params)
    @article.save
    redirect_to '/articles'
  end

  def index
    @sidebar = current_customer
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def search
    @sidebar = current_customer
    @results = @q.result
  end

  def show
    @sidebar = current_customer
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @sidebar = current_customer
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
  def set_q
    @q = Article.ransack(params[:q])
  end

  def article_params
    params.require(:article).permit(:title, :image, :body, :q)
  end
  
end
