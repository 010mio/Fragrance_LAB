class Public::ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def create
        @aeticle = Article.new(article_params)
        @article.customer_id = current_customer.id
        @article.save
        redirect_to articles_path
    end

    def index
        @articles = Article.all(article_params)
    end

    def show
        @article = Article.find(params[:id])
    end

  private
  def article_params
    params.require(:article).permit(:title, :image, :body)
  end
end
