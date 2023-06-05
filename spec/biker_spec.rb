require './lib/ride'
require './lib/biker'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#exists" do
    it "bikers exist" do
      expect(@biker).to be_a(Biker)
      expect(@biker2).to be_a(Biker)
    end
  end

  describe "#biker" do
    it "has attributes and can learn new terrain" do
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
      expect(@biker.rides).to eq({})
      expect(@biker.acceptable_terrain).to eq([])
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe "#biker logs rides" do
    it "can log rides and store them in a hash" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      @biker.log_ride(ride1, 92.5)
      @biker.log_ride(ride1, 91.1)
      @biker.log_ride(ride2, 60.9)
      @biker.log_ride(ride2, 61.6)
      expect(@biker.rides).to eq(0)
    end
  end

  describe "#personal_record" do
    it "returns the lowest time for a ride" do
      @biker.learn_terrain!(:gravel)
      @biker.log_ride(ride2, 60.9)
      @biker.log_ride(ride2, 61.6)
      expect(@biker.personal_record(ride2)).to eq(60.9)
    end
  end

  describe "#biker2 log" do
    it "does not add the ride to the log if biker2 does not know terrain" do
      @biker2.log_ride(ride1, 97.0)
      @biker2.log_ride(ride2, 67.0)
      expect(@biker2.rides).to eq({})
    end
  end



end