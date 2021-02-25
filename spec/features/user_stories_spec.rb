describe 'user stories' do
  let(:airport) { Airport.new(30, weather_reporter) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context 'when not stormy'do
  before do
    allow(weather_reporter).to receive(:stormy?).and_return false
  end
  # As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
    it 'instructs plans to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller 
    # So I can get passengers on the way to their destination 
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'responds to land method' do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    it 'confirms that plane is no longer at the airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq "Plane has taken off"
    end

    # As an air traffic controller 
    # To ensure safety 
    # I want to prevent landing when the airport is full
    it 'does not allow planes to land when airport is full' do
      30.times do
        new_plane = Plane.new
        airport.land(new_plane)
      end 
      expect { airport.land(plane) }.to raise_error "Airport full: Cannot land plane"
    end 

    # As the system designer
    # So that the software can be used for many different airports
    # I would like a default airport capacity that can be overridden as appropriate
    it 'defaults to a capacity that can be overridden' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error "Airport full: Cannot land plane"
    end 
end

  context 'when stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end
  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when weather is stormy 
    it 'does not allow planes to land when weather is stormy' do
      expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy
    it 'does not allow planes to takeoff when weather is stormy' do
      expect { airport.take_off(plane) }.to raise_error "Cannot takeoff: weather is stormy"
    end
  end

end
