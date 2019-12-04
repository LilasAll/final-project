class ArticlesController < ApplicationController


	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
		@users = User.all
	end

	def show
		#Articles are availables only for connected users:
  	if user_signed_in?
		  @article = Article.find(params[:id])
		#If user isn't register, he's redirected to login page:
		else
			flash[:alert] = "Connecte toi pour avoir accès à l'intégralité de l'article"
			redirect_to new_user_session_path
		end
	end

	def create

		@article = Article.new(title: params[:title], content: params[:content], author: current_user)
		@article.author_id = @current_user.id

				if @article.save
			redirect_to '/'
		else
    	render 'new' 
    end
	end

	  def destroy
    Article.find(params[:id]).destroy
    redirect_to'/'
  end





  def toggle_check
    @article = Article.find(params[:article_id])
    if @article.is_validated == false
      @is_validated = @article.update(is_validated: true)
    else
      @is_validated = @article.update(is_validated: false)
    end
    redirect_to '/'
  end

end
