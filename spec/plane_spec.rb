require 'plane'

describe Plane do 
  subject(:plane) { described_class.new }
  describe "#take_off"do 
    it { is_expected.to respond_to :take_off}
    it 'raises an error if it is already flying' do 
      expect { plane.take_off }.to raise_error "Plane cannot takeoff: plane already flying"
    end 
  end 

  describe '#airport' do
    it { is_expected.to respond_to :airport}
    it 'raises an error if plane is already flying' do
      expect { plane.airport }.to raise_error "Plane cannot be in the airport: plane is flying"
    end
  end
end
