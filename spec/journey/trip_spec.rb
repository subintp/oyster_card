require_relative '../../journey/trip.rb'

describe Trip do

  describe "Tube Trip" do 
    before :all do
      @trip = Trip.new("Tube Wimbledon to Earl's Court")
     end

    it "should return correct source" do
      expect(@trip.source).to eql('Wimbledon'.upcase)
    end

    it "should return correct destination" do
      expect(@trip.destination).to eql("Earl's Court".upcase)
    end

    it "should return correct fare" do
      expect(@trip.fare).to eql(3.2)
    end

    it "should return correct value for bus_trip?" do
      expect(@trip.bus_trip?).to eql(false)
    end

    it "should return correct value for tube_trip?" do
      expect(@trip.tube_trip?).to eql(true)
    end

     it "should return true for any_three_zone?" do
      expect(@trip.any_three_zone?).to eql(true)
    end

    it 'should return correct source zones' do 
      expect(@trip.source_zones).to eql([3])
    end

    it 'should return correct destination zones' do 
      expect(@trip.destination_zones).to eql([1, 2])
    end
  end

  describe "Bus Trip" do 
    before :all do
      @trip = Trip.new("328 bus from Earl's Court to Hammersmith")
     end

    it "should return correct source" do
      expect(@trip.source).to eql("Earl's Court".upcase)
    end

    it "should return correct destination" do
      expect(@trip.destination).to eql("Hammersmith".upcase)
    end

    it "should return correct fare" do
      expect(@trip.fare).to eql(1.8)
    end

    it "should return correct value for bus_trip?" do
      expect(@trip.bus_trip?).to eql(true)
    end

    it "should return correct value for tube_trip?" do
      expect(@trip.tube_trip?).to eql(false)
    end

     it "should return true for any_three_zone?" do
      expect(@trip.any_three_zone?).to eql(false)
    end

    it 'should return correct source zones' do 
      expect(@trip.source_zones).to eql([1,2])
    end

    it 'should return correct destination zones' do 
      expect(@trip.destination_zones).to eql([2])
    end
  end
end