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

  describe '#release_broken' do

    it { is_expected.to respond_to(:release_broken) }

    let(:bike) { double(:bike, broken?: true) }
    it 'releases broken bikes' do
      subject.dock(bike)
      expect(subject.release_broken).to eq [bike]
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

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { double :bike, broken?: false }

    it 'able to specify a larger capacity when necessary.' do
      expect(DockingStation).to respond_to(:new).with(1).argument
    end

    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Capacity full'
    end

    it 'allows us to dock 30 bikes' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq(30)
    end

  end

end
