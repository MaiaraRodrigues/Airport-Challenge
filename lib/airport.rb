class Airport
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    raise "Airport full: Cannot land plane" if full?
    raise "Cannot land plane: weather is stormy" if stormy?
    @planes << plane
  end 

  def take_off(plane)
    raise "Cannot takeoff: weather is stormy" if stormy?
    "Plane has taken off"
  end 

  private 
  
  def full?
    @planes.length >= @capacity
  end 

  def stormy?
    rand(1..6) > 4 
  end 

end 
