class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @articles = Article.looks(params[:search], params[:word])
  end
end
