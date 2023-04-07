class Admin::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to '/articles'
  end

end
