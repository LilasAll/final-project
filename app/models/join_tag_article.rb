# frozen_string_literal: true

class JoinTagArticle < ApplicationRecord
  belongs_to :article
  belongs_to :tag
end
