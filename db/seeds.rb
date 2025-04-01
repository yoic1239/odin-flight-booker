# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

airport_codes = [ "HKG", "YEG", "YYC", "YVR", "FUK", "HND", "NRT", "KIX" ]

airport_codes.each do |airport_code|
  Airport.find_or_create_by(airport_code: airport_code)
end

20.times do
  departure, arrival = Airport.all.sample(2)

  Flight.find_or_create_by(
    departure_airport: departure,
    arrival_airport: arrival,
    start_datetime: Faker::Time.forward(days: 90),
    duration_mins: rand(90..720) # Random between 30 minutes and 12 hours (720 minutes)
    )
end
