class LikesController < ApplicationController

  before_action :find_article

  def create
    if already_liked?
      flash[:danger] = "You can't like more than once"
    else
      @article.likes.create(user_id: current_user.id)
    end
    redirect_to articles_path

  end

  def destroy
    find_like
    @like.destroy
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
