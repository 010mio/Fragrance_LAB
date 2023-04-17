class Public::ArticlesController < ApplicationController
  before_action :authenticate_customer!, only: %i(new create)

  def new
    @article = Article.new
    if params[:tag]
      Tag.create(name: params[:tag])
    end
  end

  def create
    @article = current_customer.articles.new(article_params)
    @article.save
    redirect_to '/articles'
  end

  def index
  #タグ検索
    @articles = 
    if params[:tag_name]
      Tag.find_by_name(params[:tag_name]).articles.order(created_at: :desc).page(params[:page]).per(8)
    else
      Article.all.order(created_at: :desc).page(params[:page]).per(8)
    end
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
    params.require(:article).permit(:title, :image, :body, tag_ids: [])
  end
end
