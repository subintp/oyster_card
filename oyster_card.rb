require_relative 'journey/trip_validator'
require_relative 'journey/trip'

class OysterCard
  attr_reader :balance, :trips

  def initialize
    @balance = 0
    @trips = []
  end

  def recharge(amount)
    @balance += amount
  end

  def add_trip(input_text)
    @input_text = input_text.upcase

    if validator.valid
      create_trip
      deduct_fare
    else
      puts validator.errors
    end
  end

  def trips_taken
    @trips.each do |trip|
      p "#{trip.source} TO #{trip.destination}"
    end
  end

  private

  def validator
    validator = TripValidator.new(@input_text)
    validator.perform
    validator
  end

  def create_trip
    @current_trip = Trip.new(@input_text)
    @trips << @current_trip
  end

  def deduct_fare
    @balance -= @current_trip.fare
  end
end