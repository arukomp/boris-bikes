require 'garage'

describe Garage do

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    let(:bike) { double("bike", fix: true) }
    let(:bikes) { [ bike, bike ] }
    it 'docks the bikes into the garage' do
      subject.dock(bikes)
      expect(subject.bikes).to eq bikes
    end

  end

end
