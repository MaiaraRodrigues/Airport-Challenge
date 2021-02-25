require 'airport'

describe Airport do 
  subject(:airport) { described_class.new(30, weather_reporter) }
  let(:plane) { double :plane }
  let(:weather_reporter) { double :weather_reporter }

  describe '#land' do
    context "when not stormy" do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end 

      it 'instructs a plane to land' do 
        expect(airport).to respond_to(:land).with(1).argument
      end
  
    context 'when full' do
      it 'does not allow landing' do 
        30.times do 
          airport.land(plane)
        end 
        expect { airport.land(plane) }.to raise_error "Airport full: Cannot land plane"
      end
    end 

    describe '#take_off' do 

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
      
      it 'confirms that a plane is no longer at the airport' do
        allow(weather_reporter).to receive(:stormy?).and_return false
        airport.land(plane)
        taking_off = airport.take_off(plane)
        expect(taking_off).to eq "Plane has taken off"
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(30, weather_reporter)
        other_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error "Cannot takeoff plane: it is not at this airport"

      end

  end

  context 'defaults' do
    
    it 'has a default capacity' do
      allow(weather_reporter).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error "Airport full: Cannot land plane"
    end
  end


  end 

    context 'when stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return true
      end
      it 'raises an error if asked to land a plane when stormy' do
        expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
      end 


      it 'does not allow plane takeoff when weather is stormy' do
        allow(weather_reporter).to receive(:stormy?).and_return true 
        expect {airport.take_off(plane) }.to raise_error "Cannot takeoff: weather is stormy"
      end
    end
  end
end
