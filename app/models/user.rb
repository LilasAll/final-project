class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# ----------------------------Appartenances----------------------------------------
  has_many :attendances
  has_many :events, through: :attendances

  has_many :articles


#--------------------------- Validations --------------------- 
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez entrer un email valide" }
	#validates :pseudo, presence: true, uniqueness:  true
	#validates :city, format: { with: /\A[a-zA-Z]+\z/,
  #  message: "La ville ne peut contenir que des lettres" }
	#validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
   # message: "Le nom ne peut contenir que des lettres" }
	#validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
   # message: "Le nom ne peut contenir que des lettres" }
	#validates :password, presence: true
end
