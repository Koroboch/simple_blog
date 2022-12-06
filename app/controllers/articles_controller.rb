class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.username = current_user.username
      if @article.save
        flash[:success] = "This article was created successfully"
        redirect_to @article
      else
        render 'new', status: :unprocessable_entity
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

    if @article.update(article_params)
      flash[:success] = "This article was saved successfully"
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:warning] = "This article was deleted"
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:username, :title, :text)
  end
end
