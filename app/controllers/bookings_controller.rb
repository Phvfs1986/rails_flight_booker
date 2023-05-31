# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
  end
end
