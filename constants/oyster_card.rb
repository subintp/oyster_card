TUBE_REGEX = /TUBE(.*)\sTO\s(.*)/
BUS_REGEX = /\d+\sBUS\sFROM\s(.*)\sTO\s(.*)/

STATION_ZONE_MAPPING = {
	"HOLBORN" => [1],
  "EARL'S COURT" => [1, 2],
  "WIMBLEDON" => [3],
  "HAMMERSMITH" => [2]
}

ZONE_FARE_MAPPING = {
  anywhere_in_zone1: 2.5,
  any_one_zone_outside_zone1: 2.0,
  any_two_zones_including_zone1: 3.0,
  any_two_zones_excluding_zone1: 2.25,
  any_three_zone: 3.20,
  any_bus_journey: 1.80
}