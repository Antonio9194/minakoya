require "faker"

puts "Seeding database..."

# Wipe everything first
Booking.destroy_all
ContactMessage.destroy_all
Room.destroy_all
User.destroy_all

User.create!(
  email: "anto.vinciguerra@hotmail.it",
  password: "password",
  role: "admin",
  first_name: "Antonio",
  last_name: "Vinciguerra"
)

User.create!(
  email: "anto.vinciguerra@hotmail.com",
  password: "password",
  role: "guest",
  first_name: "Antonio",
  last_name: "Vinciguerra"
)

puts "Created Antonio’s account"

# Create 20 guest users
guests = 20.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password123",
    role: "guest",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "Created #{User.count} users"

# Create 13 standard rooms
13.times do |i|
  Room.create!(
    name: "Room #{i + 1}",
    description: "A cozy room with all the basics you need.",
    price_per_night: 80,
    size: 20,
    beds: 1,
    capacity: 2,
    amenities: "WiFi, Air conditioning, TV, Bathroom"
  )
end

# Add 1 suite
Room.create!(
  name: "Presidential Suite",
  description: "Luxury suite with panoramic view, jacuzzi, and extra comfort.",
  price_per_night: 250,
  size: 50,
  beds: 2,
  capacity: 4,
  amenities: "WiFi, Air conditioning, TV, Jacuzzi, Balcony, Minibar"
)

puts "Created #{Room.count} rooms"

# Create 40 contact messages
40.times do
  ContactMessage.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    message: Faker::Lorem.paragraph(sentence_count: 3),
    user: guests.sample
  )
end

puts "Created #{ContactMessage.count} contact messages"

# Create 30 bookings
30.times do
  start_date = Faker::Date.forward(days: rand(5..30))
  end_date   = start_date + rand(2..7).days

  Booking.create!(
    user: guests.sample,
    room: Room.all.sample,
    start_date: start_date,
    end_date: end_date,
    status: %w[pending confirmed cancelled].sample,
    payment_status: %w[pending paid refunded].sample
  )
end

puts "Created #{Booking.count} bookings"
puts "Done seeding!"
