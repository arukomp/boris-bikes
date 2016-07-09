require 'docking_station'

describe DockingStation do

  describe '#release_bike' do

    let(:bike) { double(:bike, broken?: false) }

    it { is_expected.to respond_to(:release_bike) }

    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'release a working bike' do
      subject.dock(bike)
      expect(subject.release_bike).to_not be_broken
    end

    it 'does not release a broken bike' do
      allow(bike).to receive(:broken?) { true }
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do

    let(:bike) { double(:bike) }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'allows to dock working bikes' do
      allow(bike).to receive(:broken?) { false }
      expect{ subject.dock(bike) }.to_not raise_error
    end

    it 'allows to dock broken bikes' do
      allow(bike).to receive(:broken?) { true }
      expect{ subject.dock(bike) }.to_not raise_error
    end

  end

end
