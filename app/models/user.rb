# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_reader
  # ----------------------------Appartenances----------------------------------------
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy
  has_many :articles, foreign_key: 'author_id', class_name: 'Article', dependent: :destroy
  has_many :bugs
  has_many :conversations, foreign_key: 'sender_id', class_name: 'Conversation', dependent: :destroy
  has_many :conversations, foreign_key: 'recipient_id', class_name: 'Conversation', dependent: :destroy

  has_one_attached :avatar, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :messages, dependent: :destroy

  has_many :likes, dependent: :destroy


  #--------------------------- Validations ---------------------
 
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Veuillez entrer un email valide' }
  validates :pseudo, presence: true, uniqueness: true

  validates :first_name, presence: true # format: { with: /\A[a-zA-Z]+\z/,
  # message: "Le nom ne peut contenir que des lettres" }
  # validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
  # message: "Le nom ne peut contenir que des lettres" }
  # validates :password, presence: true

  #------------------------------- Mailer --------------------------
  # after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
