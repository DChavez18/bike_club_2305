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

  def biker_with_best_time(ride)
    biker_with_best_time = nil
    best_time = nil

    @bikers.each do |biker|
      time = biker.personal_record(ride)
      if time && (best_time.nil? || time < best_time)
        biker_with_best_time = biker
        best_time = time
      end
    end
    biker_with_best_time
  end
end