require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "exists" do
    expect(@ride1).to be_a(Ride)
    expect(@ride2).to be_a(Ride)
  end

  it "has attributes and can calculate total distance" do

  end

end