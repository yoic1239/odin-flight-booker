class PassengerMailer < ApplicationMailer
  def confirmation_email
    @passenger = Passenger.find(params[:passenger])
    @booking = Booking.find(params[:booking])
    @flight = @booking.flight
    @passengers = @booking.passengers

    mail(to: @passenger.email, subject: "[Booking##{@booking.id}] Flight Booking Confirmation")
  end
end
