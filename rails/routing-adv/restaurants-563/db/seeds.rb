# require 'faker'
puts "Cleaning database"

Restaurant.destroy_all


puts "Creating restaurants..."

100.times do
    restaurant = Restaurant.new(
        name: Faker::Restaurant.name,
        stars: rand(1..5),
        address: Faker::Address.city,
        chef_name: ['Harry', 'Ron', 'Hermione', 'Mary Berry'].sample
    )
    restaurant.save!
end

puts "Created #{Restaurant.count} restaurant(s)"