require 'airport'

describe Airport do 
  subject(:airport) { described_class.new(30) }
  let(:plane) { double :plane }

  it 'instructs a plane to land' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    expect(airport).to respond_to(:take_off).with(1).argument
  end
  
  it 'confirms that a plane is no longer at the airport' do
    airport.land(plane)
    taking_off = airport.take_off(plane)
  
    expect(taking_off).to eq "Plane has taken off"
  end 

  it 'does not allow landing when at capacity' do 
    30.times do 
      airport.land(:plane)
    end 
    expect { airport.land(:plane) }.to raise_error "Airport full: Cannot land plane"
  end 

end
