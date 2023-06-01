# frozen_string_literal: true

class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @passengers_count = params[:passenger_count].to_i
    @booking = Booking.new
    @passengers_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = params[:flight_id]

    if @booking.save
      flash[:notice] = 'Booking created successfuly!'
      redirect_to @booking
    else
      flash[:warning] = 'Something went wrong'
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.destroy
      flash[:notice] = 'Booking deleted!'
    else
      flash[:warning] = 'Something went wrong'
    end
    redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email _destroy])
  end
end
