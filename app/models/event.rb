class Event < ApplicationRecord

# -----------------Appartenances----------------------------------------
	has_many :attendances
  has_many :users, through: :attendances
  
  belongs_to :creator, class_name: "User"


# -----------------Validations----------------------------------------
	validate :start_date_cannot_be_in_the_past
	def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  validate :duration_is_positif_and_5_multiple
  def duration_is_positif_and_5_multiple
  	if duration != % 5 && duration <= 0
  		errors.add(:duration, "must be multiple of 5 and higher than 0")
  	end
  end

	validates :title, presence: true, length: { in: 5..140,message: "Le titre doit contenir entre 5 et 140 caractères." }
	validates :description, presence: true, length: { in: 20..1000,message: "La description doit contenir entre 20 et 1000 caractères." }
	validates :location, presence: true

end
