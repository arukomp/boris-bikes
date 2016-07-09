require './lib/docking_station'

station = DockingStation.new
bikes = [Bike.new, Bike.new, Bike.new, Bike.new]
bikes.each { |bike| bike.report_broken }
bikes.each { |bike| station.dock(bike) }
van = Van.new
van.load_bikes(bikes)
garage = Garage.new
garage.dock(van.unload_bikes)
