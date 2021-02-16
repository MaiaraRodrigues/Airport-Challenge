class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    raise "Airport full: Cannot land plane" if full?
    @planes << plane
  end 

  def take_off(plane)
    "Plane has taken off"
  end 

  private 
  
  def full?
    @planes.length >= @capacity
  end 

end 
