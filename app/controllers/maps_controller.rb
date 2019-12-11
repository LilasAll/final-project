class MapsController < ApplicationController
	def index
		
# Pour la maps statique de lieux ESS
		gon.cities = Place.all
		gon.cities_secondhand = Place.all.where(secondhand: true)
		gon.cities_cultural = Place.all.where(cultural: true)
		gon.cities_garden = Place.all.where(garden: true)

# Pour répertorier les events sur la map
   gon.events_today = Event.all.where(start_date: (Time.now.utc+ Time.now.gmt_offset).utc..(Time.now.utc+ Time.now.gmt_offset).utc.end_of_day)

	end
end
