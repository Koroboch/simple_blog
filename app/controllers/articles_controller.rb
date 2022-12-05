class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    @new_article = Article.new(article_params)
      if @new_article.save
        flash[:notice] = "This article was saved successfully"
        redirect_to @new_article
      else
        render 'new'
      end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:username, :title, :text)
  end
end
