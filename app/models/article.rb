class Article < ApplicationRecord

	belongs_to :user

	## Validations : 
	validates :title, presence: true, length: { in: 10..100, message: "Le titre doit contenir entre 10 et 100 caractères."}
	validates :content, presence: true, length: { in: 20..10000, message: "Le contenu de l'article doit contenir entre 20 et 10000 caractères."}

end