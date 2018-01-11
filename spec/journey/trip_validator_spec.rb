require_relative '../../journey/trip_validator.rb'

describe TripValidator do

  describe "Invalid Trips" do 

    it "should return invalid due to syntax" do
      validator = TripValidator.new("Tube Wimbledon -- Earl's Court")
      validator.perform
      expect(validator.valid).to eql(false)
      expect(validator.errors).to eql('Invalid trip syntax')
    end

    it "should return invalid due to invalid station" do
      validator = TripValidator.new("Tube Wimbledon to Paris")
      validator.perform
      expect(validator.valid).to eql(false)
      expect(validator.errors).to eql('Invalid station: PARIS')
    end

  end

  describe "Valid Trips" do 
    it "should return valid as true" do
      validator = TripValidator.new("Tube Wimbledon to Earl's Court")
      validator.perform
      expect(validator.valid).to eql(true)
      expect(validator.errors).to eql('')
    end

    it "should return valid as true" do
      validator = TripValidator.new("Tube Wimbledon to Hammersmith")
      validator.perform
      expect(validator.valid).to eql(true)
      expect(validator.errors).to eql('')
    end
  end
end