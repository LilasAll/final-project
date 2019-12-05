class Like < ApplicationRecord

	belongs_to :article
	belongs_to :user

  def self.articles(user_id)
    @likes_articles= []
    @likes = Like.where(user_id: user_id)
    @likes.each do |like|
      @likes_articles << like.article_id
    end
    return @likes_articles
  end

end
