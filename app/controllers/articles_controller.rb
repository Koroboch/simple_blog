# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_article, only: %i[show edit update destroy]

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = 'This article was created successfully'
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'This article was saved successfully'
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:warning] = 'This article was deleted'
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
