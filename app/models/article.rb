# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :join_tag_articles
  has_many :tags, through: :join_tag_articles

  has_many :likes, dependent: :destroy

  ## Validations :
  validates :resume, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
