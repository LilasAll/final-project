# frozen_string_literal: true

class CalendarController < ApplicationController
  def index
    @events = Event.all
  end

  def days
    jourssemaine = {
      'Dimanche' => 0, 'Lundi' => 1, 'Mardi' => 2, 'Mercredi' => 3,
      'Jeudi' => 4, 'Vendredi' => 5, 'Samedi' => 6
    }
  end
end
