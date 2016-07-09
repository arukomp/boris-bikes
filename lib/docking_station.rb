require_relative 'bike'
require_relative 'bike_container'

class DockingStation
  include BikeContainer

  def release_bike
    raise 'No bikes available' if empty?
    release_working
  end

  private

  def release_working
    @bikes.each do |bike|
      if !bike.broken?
        # this will remove the bike from the list and return/release it
        return @bikes.delete(bike)
      end
    end
    raise 'No bikes available'
  end

end
