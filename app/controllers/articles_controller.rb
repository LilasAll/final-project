class ArticlesController < ApplicationController


	def new

		@articles = Article.new
		
	end
end
