require_relative '../constants/oyster_card'

class TripValidator

  attr_accessor :valid, :input_text

  def initialize(input_text)
    @input_text = input_text.upcase
    @valid = true
    @error_messages = []
  end

  def perform
    validate_syntax
    validate_stations
  end

  def errors
    @error_messages.join(',')
  end

  private

  def mark_as_invalid
    @valid = false
  end

  def supported_stations
    STATION_ZONE_MAPPING.keys
  end

  def validate_syntax
    return if valid_syntax?
    mark_as_invalid_syntax
  end

  def valid_syntax?
    (input_text.include?('TUBE') && TUBE_REGEX.match(input_text)) ||
    (input_text.include?('BUS') && BUS_REGEX.match(input_text))
  end

  def mark_as_invalid_syntax
    @error_messages << 'Invalid trip syntax'
    mark_as_invalid
  end

	def validate_stations
		return unless (valid && input_text.include?('TUBE'))

		source_station = TUBE_REGEX.match(input_text)[1].strip
		destination_station = TUBE_REGEX.match(input_text)[2].strip

		[source_station, destination_station].each do |station|
			unless supported_stations.include?(station)
				@error_messages << "Invalid station: #{station}"
				mark_as_invalid
			end
		end
	end
end