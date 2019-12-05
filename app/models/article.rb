# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :join_tag_articles
  has_many :tags, through: :join_tag_articles

  has_many :likes, dependent: :destroy

  ## Validations :
  validates :title, presence: true, length: { in: 10..100, message: 'Le titre doit contenir entre 10 et 100 caractères.' }
  validates :content, presence: true, length: { in: 20..10_000, message: "Le contenu de l'article doit contenir entre 20 et 10000 caractères." }
end
