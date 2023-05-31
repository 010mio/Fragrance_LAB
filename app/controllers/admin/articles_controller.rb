class Admin::ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end