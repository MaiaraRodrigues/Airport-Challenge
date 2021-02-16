describe 'user stories' do

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
  it 'instructs plans to land' do 
    airport = Airport.new(30)
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'responds to land method' do
    airport = Airport.new(30)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'confirms that plane is no longer at the airport' do
    airport = Airport.new(30)
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq "Plane has taken off"
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full
  it 'does not allow planes to land when airport is full' do
    airport = Airport.new(30)
    plane = Plane.new
    30.times do
      airport.land(plane)
    end 
    expect { airport.land(plane) }.to raise_error "Airport full: Cannot land plane"
  end 

end
