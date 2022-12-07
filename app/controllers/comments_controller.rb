class CommentsController < ApplicationController
 def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.author = current_user.username
    if @comment.save != true
      render 'new', status: :unprocessable_entity
    end

  end

  def new
    @article = Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
