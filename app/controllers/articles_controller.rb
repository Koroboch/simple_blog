class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.new(article_params)
      if @article.save
        flash[:notice] = "This article was saved successfully"
        redirect_to @article
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
    redirect_to @article
  end

  def article_params
    params.require(:article).permit(:username, :title, :text)
  end
end
