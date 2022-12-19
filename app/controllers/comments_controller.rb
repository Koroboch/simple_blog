# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    render 'new', status: :unprocessable_entity if @comment.save != true
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
