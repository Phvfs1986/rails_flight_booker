# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @booking = params
  end
end
