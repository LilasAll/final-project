class ArticlesController < ApplicationController


	def new
		@article = Article.new
	end

	def index
		@articles = Article.all
		@users = User.all
	end

	def create

		@article = Article.new(title: params[:title], content: params[:content], user_id: params['1'])
		

				if @article.save
			redirect_to '/'
		else
    	render 'new' 
    end
	end
end
