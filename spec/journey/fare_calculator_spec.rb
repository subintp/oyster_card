require_relative '../../journey/fare_calculator.rb'
require_relative '../../journey/trip.rb'

describe FareCalculator do

  it "should return correct fare for bus trip" do
    trip = Trip.new("328 bus from Earl’s Court to Chelsea")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(1.8)
  end

  it "should return correct fare for anywhere in three zones" do
    trip = Trip.new("Tube Wimbledon to Earl's Court")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(3.2)
  end

  it "should return correct fare for anywhere in zone 1" do
    trip = Trip.new("Tube Holborn to Earl's Court")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(2.5)
  end

  it "should return correct fare for any one zone outside zone 1" do
    trip = Trip.new("Tube Hammersmith to Earl's Court")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(2.0)
  end

  it "should return correct fare for any 2 zones including zone 1" do
    trip = Trip.new("Tube Hammersmith to Holborn")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(3.0)
  end

    it "should return correct fare for any 2 zones excluding zone 1" do
    trip = Trip.new("Tube Hammersmith to Wimbledon")
    fare = FareCalculator.new(trip).fare
    expect(fare).to eql(2.25)
  end
end