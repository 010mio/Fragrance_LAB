class Public::CommentsController < ApplicationController
  before_action :ensure_normal_customer, only: %i[destroy create]

  def create
    @article = Article.find(params[:article_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.score = Language.get_data(comment_params[:comment_body])
    if @comment.save
      redirect_to article_path(@article)
    else
      render template: "public/articles/show"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

end
