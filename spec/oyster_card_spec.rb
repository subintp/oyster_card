require_relative '../oyster_card.rb'
require_relative '../journey/trip.rb'

describe OysterCard do
  before :all do
    @card = OysterCard.new
   end

   it "should intialize correct default values" do
    expect(@card.balance).to eql(0)
    expect(@card.trips.count).to eql(0)
   end

   it "should recharge balance" do
    @card.recharge(100)
    expect(@card.balance).to eql(100)
   end

   it "should print error message on invalid trip input" do
    expect{@card.add_trip("Tube Wimbledon --> Earl's Court")}.to output("Invalid trip syntax\n").to_stdout
    expect(@card.trips.count).to eql(0) 
   end

   it 'should deduct fare from balance after the trip' do
    @card.add_trip("Tube Wimbledon to Earl's Court")
    expect(@card.trips.count).to eql(1) 
    expect(@card.balance).to eql(96.8) 
  end
end