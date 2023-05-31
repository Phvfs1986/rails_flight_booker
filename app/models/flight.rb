# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: :departure_airport
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: :arrival_airport
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
end
