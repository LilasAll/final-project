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
    @article = Article.new(title: params[:title], content: params[:content], resume: params[:resume], author: current_user)
    @article.author_id = @current_user.id

    @article.tags = Tag.where(id: params[:tag_id])

    if @article.save
            flash[:success] = "Ton article a été créé et en attente d'aprobation par l'admin !"

      redirect_to '/'
    else
redirect_to request.referer
  end
  end

  def destroy
    Article.find(params[:id]).destroy
redirect_to request.referer
end

  def toggle_check
    @article = Article.find(params[:article_id])
    @is_validated = if @article.is_validated == false
                      @article.update(is_validated: true)
                      flash[:success] = "Article accepté !"

                    else
                      @article.update(is_validated: false)
                      flash[:danger] = "Article non accepté !"

                    end
redirect_to request.referer
  end
end
