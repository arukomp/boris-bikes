require './lib/docking_station'

station = DockingStation.new
bikes = [Bike.new, Bike.new, Bike.new, Bike.new]
bikes.each { |bike| bike.report_broken }
garage = Garage.new
van = Van.new
garage.dock(bikes)
van.load_bikes(garage.release_bikes)
van.unload_bikes.each {|bike| station.dock(bike) }
