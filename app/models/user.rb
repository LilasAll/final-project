# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ----------------------------Appartenances----------------------------------------
  has_many :attendances
  has_many :events, through: :attendances
  has_many :articles

  has_one_attached :avatar
  has_many :comments

  has_many :likes, dependent: :destroy

  #--------------------------- Validations ---------------------
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Veuillez entrer un email valide' }
  validates :pseudo, presence: true, uniqueness: true
  # validates :city, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "La ville ne peut contenir que des lettres" }

  validates :first_name, presence: true # format: { with: /\A[a-zA-Z]+\z/,
  # message: "Le nom ne peut contenir que des lettres" }
  # validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
  # message: "Le nom ne peut contenir que des lettres" }
  # validates :password, presence: true

  #------------------------------- Mailer --------------------------
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
