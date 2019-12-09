# frozen_string_literal: true

require 'faker'

# Delete old database
User.destroy_all
Event.destroy_all
Article.destroy_all
Tag.destroy_all
JoinTagArticle.destroy_all
JoinTagEvent.destroy_all
City.destroy_all
puts 'Last database destroy'

City.create!(name: "Paris", latitude: 48.85661, longitude: 2.351499)
City.create!(name: "Lyon", latitude: 45.757814, longitude: 4.832011)
City.create!(name: "Marseille", latitude: 43.296174, longitude: 5.369953)
City.create!(name: "Toulouse", latitude: 43.604462, longitude: 1.444247)
City.create!(name: "Bordeaux", latitude: 44.841225, longitude: -0.580036)
City.create!(name: "Lille", latitude: 50.630509, longitude: 3.070641)
City.create!(name: "Nice", latitude: 43.700936, longitude: 7.268391)
City.create!(name: "Nantes", latitude: 47.218637, longitude: -1.554136)
City.create!(name: "Strasbourg", latitude: 48.584614, longitude: 7.750713)
City.create!(name: "Rennes", latitude: 48.111339, longitude: -1.68002)
puts "Cities faker generated"

10.times do
  User.create!(email: "ecolo#{rand(1..1000)}@yopmail.com", pseudo: "ecolo#{rand(1..100_000)}", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, is_admin: false, password: '123456')
end
puts '10 users created'

User.create!(pseudo: 'Admin', email: 'admin@yopmail.com', description: "Le compte administrateur est géré par les créateurs du site. C'est via ce profil que nous pouvons participer à la modération du site web. Pour tout renseignement vous pouvez nous contacter directement via l'adresse mail: synergie.urbaine@laposte.net", password: '123456', first_name: 'SYNERGIE', last_name: 'URBAINE', is_admin: 'true')
puts '1 Admin created'

10.times do
  Event.create!(is_validated: true, start_date: Faker::Date.forward(days: 250), duration: rand(1..10) * 5, title: Faker::Book.title, description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false), location: City.all.sample.id, creator: User.all.sample, price: rand(0...30))
end
puts '10 events created'

10.times do
  Article.create!(is_validated: true, title: Faker::Lorem.paragraph_by_chars(number: 10, supplemental: false), content: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false), author: User.all.sample)
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
