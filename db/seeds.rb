# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
# Flight.delete_all

codes = %w[BSB GRU GIG CGH VIX POA GYN BPS PMW SLZ REC]

codes.each { |code| Airport.create!(code:) }

100.times do
  kodes = Airport.where(code: codes.sample(2))
  Flight.create!(departure_airport: kodes.first, arrival_airport: kodes.last,
                 departure_time: rand(2.year).seconds.from_now, duration: rand(45..180))
end
