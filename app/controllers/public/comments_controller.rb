class Public::CommentsController < ApplicationController
  before_action :ensure_normal_customer, only: %i[destroy create]

  def create
    @article = Article.find(params[:article_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.article_id = @article.id
    @comment.score = Language.get_data(comment_params[:comment_body])
    @comment.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    Comment.find(params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_body)
  end

end
