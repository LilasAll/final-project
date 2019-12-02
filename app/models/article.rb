class Article < ApplicationRecord

	belongs_to :user

	## Validations : 
	validates :title, presence: true 
	validates :content, presence: true, length: { in: 20..600, message: "Le titre doit contenir entre 20 et 600 caractères."}

end