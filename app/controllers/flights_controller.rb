# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @departure_airport = params[:departure_airport]
    @arrival_airport = params[:arrival_airport]

    @search = Flight.all.where(departure_airport: @departure_airport, arrival_airport: @arrival_airport)
  end
end
