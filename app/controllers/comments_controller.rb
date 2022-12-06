class CommentsController < ApplicationController
 def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.author = current_user.username
    @comment.user_id = current_user.id
    @comment.save

  end

  def new
    @article = Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
