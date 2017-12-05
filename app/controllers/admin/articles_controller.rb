class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_article, only: [:edit, :update, :destroy]
  layout "admin"

  # ---CRUD---

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to admin_articles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
      redirect_to admin_articles_path
  end


  def publish
    @article = Article.find(params[:id])
    @article.publish!
    redirect_to :back
  end

  def hide
    @article = Article.find(params[:id])
    @article.hide!
    redirect_to :back
  end





  # ---private---

  private

  def find_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :content,:summary, :user_id, :image, :is_hidden)
  end




end
