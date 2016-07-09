require './lib/docking_station'

station = DockingStation.new
bike = Bike.new.report_broken
station.dock(bike)
station.release_bike