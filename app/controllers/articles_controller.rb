class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :find_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.order("created_at DESC")
  end

  def show
    @user = @article.user
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
      redirect_to articles_path
  end





  private

  def find_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :content,:summary, :user_id, :image)
  end


end
