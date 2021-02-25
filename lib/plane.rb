class Plane

  def take_off
    raise "Plane cannot takeoff: plane already flying"
  end 

  def airport
    raise "Plane cannot be in the airport: plane is flying"
  end 
end
