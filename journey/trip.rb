require_relative '../constants/oyster_card'
require_relative 'fare_calculator'


class Trip
  attr_accessor :input_text, :parsed_trip

  def initialize(input_text)
    @input_text = input_text.upcase
  end

  def source
    parsed_trip[1].strip
end

  def destination
    parsed_trip[2].strip
  end

  def fare
    FareCalculator.new(self).fare
  end

  def bus_trip?
    input_text.include?('BUS')
  end

  def tube_trip?
    input_text.include?('TUBE')
  end

  def any_three_zone?
    (STATION_ZONE_MAPPING[source] + STATION_ZONE_MAPPING[destination]).uniq.length == 3
  end

  def source_zones
    STATION_ZONE_MAPPING[source]
  end

  def destination_zones
    STATION_ZONE_MAPPING[destination]
  end

  private

  def parsed_trip
    @parsed_trip ||= parsing_regex.match(input_text)
  end

  def parsing_regex
    input_text.include?('TUBE') ? TUBE_REGEX : BUS_REGEX
  end
end