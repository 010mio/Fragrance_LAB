class Public::SearchesController < ApplicationController
  before_action :authenticate_custoemr!

  def search
    @range = params[:range]
    @articles = Article.looks(params[:search], params[:word])
  end
end
