class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @num_tickets = params[:num_tickets]
    @booking = Booking.new
  end

  def create
  end
end
