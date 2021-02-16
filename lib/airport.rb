class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end 

  def land(plane)
    raise "Airport full: Cannot land plane" if @planes.length >= @capacity
    @planes << plane
  end 

  def take_off(plane)
    "Plane has taken off"
  end 

end 
