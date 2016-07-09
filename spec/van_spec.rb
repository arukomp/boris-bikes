require 'van'

describe Van do

  describe '#load_bikes' do

    it { is_expected.to respond_to(:load_bikes).with(1).argument }

    let(:bikes) { [double(:bike), double(:bike)] }
    it 'loads the bikes onto the van' do
      subject.load_bikes(bikes)
      expect(subject.bikes).to eq bikes
    end

  end

  describe '#unload_bikes' do

    it { is_expected.to respond_to(:unload_bikes) }

    let(:bikes) { [double(:bike), double(:bike)] }
    it 'unloads the bikes from the van and returns them' do
      subject.load_bikes(bikes)
      expect(subject.unload_bikes).to eq bikes
      expect(subject.bikes).to eq []
    end

  end

end
