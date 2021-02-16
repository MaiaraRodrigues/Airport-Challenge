class Airport

  def initialize(capacity)
    @capacity = capacity
    @number_of_planes_landed = 0
  end 

  def land(plane)
    raise "Airport full: Cannot land plane" if @number_of_planes_landed >= @capacity
    @number_of_planes_landed += 1
  end 

  def take_off(plane)
    "Plane has taken off"
  end 

end 
