class FlightsController < ApplicationController
  def index
    @airport_options = Airport.pluck(:airport_code).sort
    @flight_date_options = Flight.pluck(:start_datetime).map { |datetime| [ datetime.strftime("%Y %b %d"), datetime.to_date ] }.uniq.sort
  end
end
