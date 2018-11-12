

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
url = ["https://res.cloudinary.com/depdgfsrb/image/upload/v1541742604/boats/boat3.png", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742581/boats/boat5.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742578/boats/boat4.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742577/boats/boat14.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742577/boats/boat13.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat12.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat11.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat9.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742575/boats/boat10.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742575/boats/boat8.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat7.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat2.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat1.jpg"]

counter = 0

array_of_users.each do |user|
  3.times do
    boat = Boat.new(
      name:   Faker::Cat.name,
      boat_type: "sailing boat",
      description: Faker::HarryPotter.quote,
      location: Faker::Address.full_address,
      daily_price: rand(0..1000),
      capacity: rand(0..20),
      crew_number: rand(0..5),
      user_id: user.id
      )
    boat.remote_photo_url = url.sample
    boat.save
  end
  counter +=1
end

# boats = Boat.all
# boat = boats.sample


# array_of_users.each do |user|
#   2.times do
#     booking = Booking.create!(
#       user_id: user.id,
#       boat_id: boat.id,
#       start_date: "9-11-2018",
#       end_date:"12-11-2018",
#       status: "confirmed",
#       passenger_number: rand(1..10),
#       total_price: rand(500..1000)
#       )
#   end
# end
