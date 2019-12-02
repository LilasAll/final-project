class Event < ApplicationRecord

# -----------------Appartenances----------------------------------------
	has_many :attendances
  has_many :users, through: :attendances
  
  belongs_to :creator, class_name: "User"


# -----------------Validations----------------------------------------
	validate :start_date_cannot_be_in_the_past
	def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "L'évènement doit être à venir")
    end
  end

  validate :duration_is_positif_and_5_multiple
  def duration_is_positif_and_5_multiple
  	if duration != % 5 && duration <= 0
  		errors.add(:duration, "La durée doit être un multiple de 5 minutes")
  	end
  end

	validates :title, presence: true, length: { in: 5..140,message: "Le titre doit contenir entre 5 et 140 caractères." }
	validates :description, presence: true, length: { in: 10..1000,message: "La description doit contenir entre 10 et 1000 caractères." }
	validates :location, presence: true

end
