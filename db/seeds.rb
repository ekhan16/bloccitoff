require 'faker'

#Create Items
10.times do
	Item.create!(
		title:   Faker::Lorem.sentence,
		body:    Faker::Lorem.paragraph
		)
end
items = Item.all

puts "Seed finished"
puts "#{Item.count} items created"