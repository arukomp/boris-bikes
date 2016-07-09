require 'docking_station'
require 'garage'
require 'van'

shared_examples_for "BikeContainer" do

  let(:bike) { double("bike", fix: true) }
  let(:bikes) { [ bike, bike ] }

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks the bikes into #{described_class}" do
      subject.dock(bikes)
      expect(subject.bikes).to eq bikes
    end

  end

  describe '#release_bikes' do

    it { is_expected.to respond_to(:release_bikes) }

    it "releases the bikes from #{described_class}" do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock(bikes)
      expect(subject.release_bikes).to eq bikes
      expect(subject.bikes).to eq []
    end

  end

  describe 'initialization' do

    it 'able to specify a larger capacity when necessary.' do
      expect(described_class).to respond_to(:new).with(1).argument
    end

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Capacity full'
    end

    it 'allows us to dock 30 bikes' do
      container = described_class.new(30)
      expect(container.capacity).to eq(30)
    end

  end

end

describe Van do
  it_behaves_like "BikeContainer"
end

describe Garage do
  it_behaves_like "BikeContainer"
end

describe DockingStation do
  it_behaves_like "BikeContainer"
end
