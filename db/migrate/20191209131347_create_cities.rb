class CreateCities < ActiveRecord::Migration[5.2]
  
	require 'csv'

  def change
    create_table :cities do |t|
      t.string :name
      t.decimal :latitude, :precision => 15, :scale => 13
      t.decimal :longitude, :precision => 15, :scale => 13

      t.timestamps
    end

    
CSV.foreach("db/cities_fr.csv", headers: true) do |row|
  city = City.create(name: row["city"], latitude: row["lat"].to_f,longitude: row["lng"].to_f)
    puts "#{city.name} created"
  end
  end


end
