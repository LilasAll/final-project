class CreatePlaces < ActiveRecord::Migration[5.2]
  
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :latitude, :precision => 15, :scale => 13
      t.decimal :longitude, :precision => 15, :scale => 13


# Trier les lieux pour les afficher sur la map :
      t.boolean :associations, default: false

      t.boolean :meeting, default: false

      t.boolean :recycling, default: false
      t.boolean :garden, default: false
      t.boolean :shared_garden, default: false

      t.boolean :zero_waste, default: false
      t.boolean :secondhand, default: false

      t.boolean :cultural, default: false

      t.boolean :feminist, default: false

      t.timestamps
    end

    require 'csv'

    
CSV.foreach("db/cities_fr.csv", headers: true) do |row|
  city = Place.create(name: row["city"], latitude: row["lat"].to_f,longitude: row["lng"].to_f)
    puts "#{city.name} created"
  end
  end


end
