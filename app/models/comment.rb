# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user # Comment en relation N-1 avec user et gossip et en relation N-1 avec Like
  belongs_to :event
end
