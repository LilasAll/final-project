# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like

  def create
    if already_liked?
      flash[:error] = "You can't like more than once"
    else
      flash[:success] = "Vous avez bien liké l'article"
      @article.likes.create(user_id: current_user.id)
    end
    redirect_to request.referer
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end

    redirect_to article_path(@article.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def already_liked?
    Like.where(user_id: current_user.id, article_id: params[:article_id]).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, article_id: params[:article_id]).first
 end

  # Never trust parapmeters from the scary internet, only allow the white list through.
end
