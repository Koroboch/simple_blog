class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_article, only: %w[show edit update destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.username = current_user.username
      if @article.save
        flash[:success] = "This article was created successfully"
        redirect_to @article
      else
        render 'new', status: :unprocessable_entity
      end
  end

  def show
  end

  def edit
  end

  def update

    if @article.update(article_params)
      flash[:success] = "This article was saved successfully"
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:warning] = "This article was deleted"
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
