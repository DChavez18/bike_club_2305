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

  describe "#biker with most rides" do
    it "can return the biker with the most rides" do
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 25)

      @bike_club_1.add_biker(biker)
      @bike_club_1.add_biker(biker2)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:hills)
      biker.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.learn_terrain!(:gravel)

      biker.log_ride(ride1, 92.5)
      biker.log_ride(ride2, 60.9)
      biker2.log_ride(ride1, 91.1)

      expect(@bike_club_1.biker_with_most_rides).to eq(biker)
    end
  end

  describe "#biker with best time" do
    it "can return the biker with the fastest time on a given ride" do
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 20)

      @bike_club_1.add_biker(biker)
      @bike_club_1.add_biker(biker2)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:hills)
      biker.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.learn_terrain!(:gravel)

      biker.log_ride(ride1, 90.5)
      biker2.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker2.log_ride(ride2, 61.6)

      expect(@bike_club_1.biker_with_best_time(ride1)).to eq(biker)
      expect(@bike_club_1.biker_with_best_time(ride2)).to eq(biker)
    end
  end

  describe "#eligible" do
    it "returns the bikers who are eligible based on terrain and max_distance" do
      biker = Biker.new("Kenny", 30)
      biker2 = Biker.new("Athena", 20)

      @bike_club_1.add_biker(biker)
      @bike_club_1.add_biker(biker2)

      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      biker.learn_terrain!(:gravel)
      biker2.learn_terrain!(:hills)
      biker2.learn_terrain!(:gravel)

      biker.log_ride(ride1, 90.5)
      biker2.log_ride(ride1, 91.1)
      biker.log_ride(ride2, 60.9)
      biker2.log_ride(ride2, 61.6)
      expect(@bike_club_1.eligible(ride1)).to eq(biker2)
    end
  end


end