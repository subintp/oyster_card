require_relative '../../journey/zone_identifier.rb'

describe ZoneIdentifier do

  it "should return anywhere in zone 1" do
    expect(ZoneIdentifier.indentifier(1,1)).to eql(:anywhere_in_zone1)
  end

  it 'should return any one zone outside zone 1' do 
    expect(ZoneIdentifier.indentifier(2,2)).to eql(:any_one_zone_outside_zone1)
  end

  it 'should return any 2 zones including zone 1' do 
    expect(ZoneIdentifier.indentifier(2,1)).to eql(:any_two_zones_including_zone1)
  end

  it 'should return any 2 zones excluding zone 1' do 
    expect(ZoneIdentifier.indentifier(2,3)).to eql(:any_two_zones_excluding_zone1)
  end
end