class FlightsController < ApplicationController
  def index
    @airport_options = Airport.pluck(:airport_code).sort
    @flight_date_options = Flight.pluck(:start_datetime).map { |datetime| [ datetime.strftime("%Y %b %d"), datetime.to_date ] }.uniq.sort

    @results = search_flights if params[:num_tickets]
  end

  def search_flights
    results = Flight.all

    if params[:departure_code].present?
      departure_airport = Airport.find_by(airport_code: params[:departure_code])
      results = results.where(departure_airport: departure_airport)
    end

    if params[:arrival_code].present?
      arrival_airport = Airport.find_by(airport_code: params[:arrival_code])
      results = results.where(arrival_airport: arrival_airport)
    end

    if params[:date].present?
      results = results.where("DATE(start_datetime) = ?", params[:date])
    end

    results.order(:start_datetime)
  end
end
