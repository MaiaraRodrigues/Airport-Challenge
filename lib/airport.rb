require 'weather_reporter'

class Airport
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []
  end 

  def land(plane)
    raise "Airport full: Cannot land plane" if full?
    raise "Cannot land plane: weather is stormy" if stormy?
    @planes << plane
  end 

  def take_off(plane)
    raise "Cannot takeoff: weather is stormy" if stormy?
    raise "Cannot takeoff plane: it is not at this airport" unless at_airport?(plane)
    "Plane has taken off"
  end 

  private 
  
  def full?
    @planes.length >= @capacity
  end 

  def stormy?
    @weather_reporter.stormy?
  end 

  def at_airport?(plane)
    @planes.include?(plane)
  end 

end 
