require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe "#rides" do
    it "exists" do
    expect(@ride1).to be_a(Ride)
    expect(@ride2).to be_a(Ride)
    end
  end

  describe "#ride1" do
    it "has attributes and can calculate total distance" do
    expext(@ride1.name).to eq("Walnut Creek Trail")
    expext(@ride1.distance).to eq(10.7)
    expext(@ride1.terrain).to eq(:hills)
    expext(@ride1.loop?).to eq(false)
    expect(@ride1.total_distance).to eq(21.4)
    end
  end

  describe "#ride2" do
    it "has attributes and a total distance" do
      expect(@ride2.loop?).to eq(true)
      expect(@ride2.total_distance).to eq(14.9)
    end
  end
  

end