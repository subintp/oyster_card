require_relative 'zone_identifier'
require_relative '../constants/oyster_card'

class FareCalculator
  attr_accessor :trip

  def initialize(trip)
    @trip = trip
  end

  def fare
    if trip.bus_trip?
      ZONE_FARE_MAPPING[:any_bus_journey]
    elsif trip.any_three_zone?
      ZONE_FARE_MAPPING[:any_three_zone]
    else
      optimized_fare
    end
  end

  private

  def optimized_fare
    fares = []
    trip.source_zones.each do |source_zone|
      trip.destination_zones.each do |destination_zone|
        fares << ZONE_FARE_MAPPING[ZoneIdentifier.indentifier(source_zone,destination_zone)]
      end
    end
    fares.min
  end
end