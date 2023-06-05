class BikeClub
  attr_reader :name, 
              :bikers
  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def biker_with_most_rides
    return nil if @bikers.empty?

    most_rides_biker = @bikers.first
    most_rides = most_rides_biker.rides_count

    @bikers.each do |biker|
      rides = biker.rides_count
      if rides > most_rides
        most_rides_biker = biker
        most_rides = rides
      end
    end
    most_rides_biker
  end
end