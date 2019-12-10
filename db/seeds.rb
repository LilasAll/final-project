# frozen_string_literal: true

require 'faker'

# Delete old database
User.destroy_all
Event.destroy_all
Article.destroy_all
Tag.destroy_all
JoinTagArticle.destroy_all
JoinTagEvent.destroy_all
Place.destroy_all
puts 'Last database destroy'

Place.create!(name: "Paris", latitude: 48.85661, longitude: 2.351499)
Place.create!(name: "Lyon", latitude: 45.757814, longitude: 4.832011)
Place.create!(name: "Marseille", latitude: 43.296174, longitude: 5.369953)
Place.create!(name: "Toulouse", latitude: 43.604462, longitude: 1.444247)
Place.create!(name: "Bordeaux", latitude: 44.841225, longitude: -0.580036)
Place.create!(name: "Lille", latitude: 50.630509, longitude: 3.070641)
Place.create!(name: "Nice", latitude: 43.700936, longitude: 7.268391)
Place.create!(name: "Nantes", latitude: 47.218637, longitude: -1.554136)
Place.create!(name: "Strasbourg", latitude: 48.584614, longitude: 7.750713)
Place.create!(name: "Rennes", latitude: 48.111339, longitude: -1.68002)
puts "Cities faker generated"

Place.create!(name: "Oxfam Le Magasin", latitude: 50.6334154, longitude: 3.0597793, secondhand: true)
Place.create!(name: "Café citoyen", latitude: 50.632807, longitude: 3.063476, meeting: true, cultural:true)
Place.create!(name: "L'auberge de Jeunesse Stephane Hessel", latitude: 50.6242888, longitude: 3.072359, cultural: true)
Place.create!(name: "Le jardin des Maguettes", latitude: 50.6353682, longitude: 3.084535, garden: true)
Place.create!(name: "L'auberge de Jeunesse Stephane Hessel", latitude: 50.6242888, longitude: 3.072359, cultural: true)


puts "Mes lieux spécifiques créés"


10.times do
  User.create!(email: "ecolo#{rand(1..1000)}@yopmail.com", pseudo: "ecolo#{rand(1..100_000)}", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, is_admin: false, password: '123456')
end
puts '10 users created'

User.create!(pseudo: 'Admin', email: 'admin@yopmail.com', description: "Le compte administrateur est géré par les créateurs du site. C'est via ce profil que nous pouvons participer à la modération du site web. Pour tout renseignement vous pouvez nous contacter directement via l'adresse mail: synergie.urbaine@laposte.net", password: '123456', first_name: 'SYNERGIE', last_name: 'URBAINE', is_admin: 'true')
puts '1 Admin created'

10.times do
  Event.create!(is_validated: true, start_date: Faker::Date.forward(days: 250), duration: rand(1..10) * 5, title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false), location: Place.all.sample.id, creator: User.all.sample, price: rand(0...30))
end
puts '10 events created'

10.times do
  Article.create!(is_validated: true, title: Faker::Lorem.paragraph_by_chars(number: 10, supplemental: false), resume: "Voici un super résumé d'un événement oulalala", content: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false), author: User.all.sample)
end
puts '10 articles created'

Tag.create!(name: 'Bon Plan')
Tag.create!(name: 'DIY')
Tag.create!(name: 'Ecolo')
Tag.create!(name: 'Agriculture urbaine')
Tag.create!(name: 'Alimentation')
Tag.create!(name: 'Sortie')
Tag.create!(name: 'Rencontre')
Tag.create!(name: 'Local')
Tag.create!(name: 'Energie')
Tag.create!(name: 'Climat')
Tag.create!(name: 'Transport')
Tag.create!(name: 'Solidaire')

30.times do
  JoinTagArticle.create!(article: Article.all.sample, tag: Tag.all.sample)
end
puts '30 links between tags and articles created'

30.times do
  JoinTagEvent.create!(event: Event.all.sample, tag: Tag.all.sample)
end
puts '30 links between tags and articles created'

20.times do
  Attendance.create!(event: Event.all.sample, user: User.all.sample, stripe_customer_id: Faker::Alphanumeric.alpha(number: 6))
end
puts '20 attendances created'
