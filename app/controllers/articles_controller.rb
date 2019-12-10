# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i[new show index]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
    @users = User.all
    @articles_likes = Like.articles(current_user.id)
  end

  def show
    # Articles are availables only for connected users:
    if user_signed_in?
      @article = Article.find(params[:id])
      @like = Like.where(article_id: params[:article_id])
    # If user isn't register, he's redirected to login page:
    else
      flash[:alert] = "Connecte toi pour avoir accès à l'intégralité de l'article"
      redirect_to new_user_session_path
    end
  end

  def create
    @article = Article.new(title: params[:title], content: params[:content], author: current_user)
    @article.author_id = @current_user.id

    @article.tags = Tag.where(id: params[:tag_id])

    if @article.save
      redirect_to '/'
    else
      render 'new'
  end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to '/'
  end

  def article_params
    params.require(:article).permit(:name, :content)
  end

  def toggle_check
    @article = Article.find(params[:article_id])
    @is_validated = if @article.is_validated == false
                      @article.update(is_validated: true)
                    else
                      @article.update(is_validated: false)
                    end
    redirect_to '/'
  end
end
