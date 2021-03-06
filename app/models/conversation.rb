# frozen_string_literal: true

class Conversation < ActiveRecord::Base
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
  acts_as_readable on: :created_at

  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id

  validates :sender_id, presence: :true
  validates :recipient_id, presence: :true

  scope :between, lambda { |sender_id, recipient_id|
    where("(conversations.sender_id = ? AND conversations.recipient_id =?)
		OR (conversations.sender_id = ? AND conversations.recipient_id =?)",
          sender_id, recipient_id, recipient_id, sender_id)
  }
end
