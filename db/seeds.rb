# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

steven = User.create!(email: 'steven.vaneecke@gmail.com', password: "Steven")
kenny = User.create!(email: 'kenny.cuoq@gmail.com', password: "KennyKenny")
frederik = User.create!(email: 'frederik.hossak@gmail.com', password: "Frederik")
dree = User.create!(email: 'andreasava@hotmail.com', password: "DreeDree")

array_of_users = []
array_of_users << steven
array_of_users << kenny
array_of_users << frederik
array_of_users << dree

array_of_users.each do |user|
  3.times do
    boat = Boat.create!(
      name:   Faker::Cat.name,
      boat_type: "sailing boat",
      description: Faker::HarryPotter.quote,
      location: Faker::Address.country,
      daily_price: rand(0..1000),
      capacity: rand(0..20),
      crew_number: rand(0..5),
      photo: "This is a picture",
      user_id: user.id
      )
  end
end



