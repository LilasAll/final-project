require 'faker'

#Delete old database
User.destroy_all
Event.destroy_all
Article.destroy_all
Tag.destroy_all
JoinTagArticle.destroy_all
JoinTagEvent.destroy_all
puts "Last database destroy"

10.times do
	User.create!(email: "user#{rand(1..1000)}@yopmail.com",pseudo: "pseudo#{rand(1..100000)}",city: Faker::Address.city,first_name: Faker::Name.first_name,last_name: Faker::Name.last_name,is_admin: false,password: "123456")
end
puts "10 users created"

User.create!(pseudo:'admin', email:'admin@yopmail.com',city: 'Lille', password:'123456',first_name:'adminfn',last_name: "adminln",is_admin:'true')
puts "1 Admin created"

10.times do
	Event.create!(start_date: Faker::Date.forward(days: 250),duration: rand(1..10)*5,title: Faker::Book.title,description: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false),location: Faker::Movies::LordOfTheRings.location, creator: User.all.sample,price: rand(0..30))
end
puts "10 events created"

10.times do
	Article.create!(is_validated: true, title: Faker::Lorem.paragraph_by_chars(number: 10, supplemental: false),content: Faker::Lorem.paragraph_by_chars(number: 400, supplemental: false),author: User.all.sample)
end
puts "10 articles created"

10.times do
	Tag.create!(name: Faker::Book.title)
end
puts "10 tags created"

30.times do
	JoinTagArticle.create!(article: Article.all.sample, tag: Tag.all.sample)
end
puts "30 links between tags and articles created"

30.times do
	JoinTagEvent.create!(event: Event.all.sample, tag: Tag.all.sample)
end
puts "30 links between tags and articles created"

20.times do
	Attendance.create!(event: Event.all.sample, user: User.all.sample, stripe_customer_id: Faker::Alphanumeric.alpha(number: 6))
end
puts "20 attendances created"

@admin = User.create(pseudo:'admin', email:'admin@admin.com',password:'123456',first_name:'admin',is_admin:'true')