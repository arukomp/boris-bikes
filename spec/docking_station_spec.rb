require 'docking_station.rb'

describe DockingStation do

  it { expect(DockingStation.new.respond_to? "release_bike").to eq true }

end
