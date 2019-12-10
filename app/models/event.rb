# frozen_string_literal: true

class Event < ApplicationRecord
  # -----------------Appartenances----------------------------------------
  has_many :attendances
  has_many :users, through: :attendances
  has_many :comments

  belongs_to :creator, class_name: 'User'

  has_one_attached :image_event

  has_many :join_tag_events
  has_many :tags, through: :join_tag_events



  # -----------------Validations----------------------------------------

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "L'évènement doit être à venir")
    end
  end

  def duration_is_positif_and_5_multiple
    if duration != %(5) && duration <= 0
      errors.add(:duration, 'La durée doit être un multiple de 5 minutes')
    end
  end

  validate :start_date_cannot_be_in_the_past
  validates :start_date, presence: true
  validate :duration_is_positif_and_5_multiple
  validates :title, presence: true, length: { in: 5..140, message: 'Le titre doit contenir entre 5 et 140 caractères.' }
  validates :description, presence: true, length: { in: 10..1000, message: 'La description doit contenir entre 10 et 1000 caractères.' }
  validates :location, presence: true
end
