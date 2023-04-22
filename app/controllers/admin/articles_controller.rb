class Admin::ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to '/admin/articles'
  end

end
