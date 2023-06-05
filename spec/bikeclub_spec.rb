require './lib/ride'
require './lib/biker'
require './lib/bikeclub'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club_1 = BikeClub.new("D's Bike Club")
  end

  describe "#exists" do
    it "exists and has a name" do
      expect(@bike_club_1).to be_a(BikeClub)
      expect(@bike_club_1.name).to eq("D's Bike Club")
    end
  end

  describe "#add_biker" do
    it "can add a new biker to bikeclub" do
      biker = Biker.new("Kenny", 30)
      @bike_club_1.add_biker(biker)
      expect(@bike_club_1.bikers).to eq([biker])
    end
  end


end