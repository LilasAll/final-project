class ArticlesController < ApplicationController


	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
		@users = User.all
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
end
