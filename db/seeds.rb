

User.destroy_all

puts "Creating users..."
steven = User.new(email: 'steven.vaneecke@gmail.com', password: "Steven")
url = 'https://avatars2.githubusercontent.com/u/41968309?v=4'
steven.photo = url
steven.first_name = 'Steven'
steven.last_name = 'Van Eecke'
steven.save!
kenny = User.create!(email: 'kenny.cuoq@gmail.com', password: "KennyKenny")
url = 'https://avatars1.githubusercontent.com/u/26207944?v=4'
kenny.photo = url
kenny.first_name = 'Kenny'
kenny.last_name = 'Cuoq'
kenny.save!
frederik = User.create!(email: 'frederik.hossak@gmail.com', password: "Frederik")
url = 'https://avatars0.githubusercontent.com/u/43231640?v=4'
frederik.photo = url
frederik.first_name = 'Frederik'
frederik.last_name = 'Hossak'
frederik.save!
dree = User.create!(email: 'andreasava@hotmail.com', password: "DreeDree")
url = 'https://avatars0.githubusercontent.com/u/43139321?v=4'
dree.photo = url
dree.first_name = 'Andrea'
dree.last_name = 'Van Assche'
dree.save!


array_of_users = []
array_of_users << steven
array_of_users << kenny
array_of_users << frederik
array_of_users << dree
url_array = ["https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat1.jpg", 'https://www.cirocapriboats.com/images/slide15.jpg', 'http://www.bluesun2.com.au/wp-content/uploads/2017/08/SILVERADO-SWAN-RIVER-CARNAC-BLUESUN-2-BOAT-CHARTERS-.jpg', 'http://www.getawayatthelake.com/slider/boat-rentals.jpg', 'https://shellislandshuttle.com/wp-content/uploads/2017/08/landingpage_image_pontoon.jpg', 'http://clevelandboatshow.com/wp-content/uploads/2015/06/Lifestyle_2Boats2Girls_SeaRay_ASextended.jpg', 'http://www.sealagoon.com/cms/wp-content/themes/sea2015/images/sliders/main00.jpg', 'http://www.sealagoon.com/cms/wp-content/themes/sea2015/images/sliders/main01.jpg', 'http://img.over-blog-kiwi.com/600x450-ct/1/04/49/45/20141214/ob_979913_wally-esense-1.jpg', 'https://bayliner.com/wp-content/uploads/2015/08/ElementXR7ButonSeriesRollOverImg.jpg', 'https://bayliner.com/wp-content/uploads/2015/08/bayliner195deckboat_Masonry_Ajpg1.jpg', 'https://bayliner.com/wp-content/uploads/2018/07/BAY-215DB-DeckBoatPage-Masonry-D.jpg']
#"https://res.cloudinary.com/depdgfsrb/image/upload/v1541742604/boats/boat3.png", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742581/boats/boat5.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742578/boats/boat4.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742577/boats/boat14.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742577/boats/boat13.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat12.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat11.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742576/boats/boat9.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742575/boats/boat10.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742575/boats/boat8.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat7.jpg", "https://res.cloudinary.com/depdgfsrb/image/upload/v1541742574/boats/boat2.jpg"


counter = 0
puts "Now creating boats..."
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
    url = url_array.sample
    boat.remote_photo_url = url
    url_array.delete(url)
    boat.save
  end
  counter +=1
end

puts "Now creating bookings..."
array_of_users.each do |user|
  3.times do
    booking = Booking.new
    booking.user = user
    booking.boat = Boat.where.not(user: user).sample
    # puts "Boat booked is #{booking.boat}"
    booking.start_date = Date.parse("12-12-2018")
    booking.end_date = Date.parse("23-12-2018")
    # booking.status = "Pending"
    # puts "SAving again"
    booking.passenger_number = rand(1..10)
    booking.total_price = booking.boat.daily_price * (booking.end_date - booking.start_date).to_i
    booking.save!
  end
end

puts "..done!"

# for each user, create 4 bookings on boats that arent his

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
