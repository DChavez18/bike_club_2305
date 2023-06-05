require './lib/ride'
require './lib/biker'
require './lib/bikeclub'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club_1 = BikeClub.new("D's Bike Club")
  describe "#exists" do
    it "exists and has a name" do
      expect(@bike_club_1).to be_a(BikeClub)
      expect(@bike_club_1).to eq("D's Bike Club")
    end
  end
  

end