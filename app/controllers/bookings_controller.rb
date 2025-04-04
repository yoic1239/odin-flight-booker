class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @num_tickets = params[:num_tickets].to_i
    @booking = Booking.new
    @num_tickets.times { @booking.passengers.build }
  end

  def create
  end
end
