require 'weather_reporter'

describe WeatherReporter do
  subject(:weather_reporter) {described_class.new }

  describe '#stormy'do
    it 'can be stormy' do
      allow(Kernel).to receive(:rand).and_return 5
      expect(weather_reporter.stormy?).to be true 
    end
    it 'can be non-stormy' do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather_reporter.stormy?).to be false
    end
  end

end