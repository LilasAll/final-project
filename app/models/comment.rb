# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user 
  belongs_to :event

  validates :content, presence: true, length: { in: 1..240, message: 'Le commentaire doit contenir entre 10 et 240 charactère'}
end
