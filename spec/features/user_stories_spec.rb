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
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
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
    # Edge case for planes that are not in the airport
    it "takes off planes only from the airport they are at" do
      airport_2 = Airport.new(20, weather_reporter)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Cannot takeoff plane: it is not at this airport"
    end

    #Edge case: if plane is flying cannot takeoff
    it "flying planes cannot takeoff" do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.take_off }.to raise_error "Plane cannot takeoff: plane already flying"
    end

    #Edge case: if plane is flying cannot be in the airport
    it "Flying plane cannot be in an airport" do
      airport.land(plane)
      flying_plane = airport.take_off(plane)
      expect { flying_plane.airport }.to raise_error "Plane cannot be in the airport: plane is flying"
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
