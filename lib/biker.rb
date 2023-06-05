class Biker
  attr_reader :name, 
              :max_distance, 
              :rides,
              :acceptable_terrain
  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
    @rides_count = 0
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain unless @acceptable_terrain.include?(terrain)
  end
  
  def log_ride(ride, time)
    return unless acceptable_terrain.include?(ride.terrain)
  
    if ride.total_distance <= max_distance
      @rides[ride] ||= []
      @rides[ride] << time
    end
  end

  def personal_record(ride)
    return false unless @rides.key?(ride)

    @rides[ride].min
  end

  def rides_count
    @rides.size
  end
end