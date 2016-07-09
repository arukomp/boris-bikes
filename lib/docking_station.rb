require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Capacity full' if full?
    accept_bike(bike)
  end

  private

  attr_reader :bikes
  
  def full?
    @bikes.count + @broken_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
  
  def accept_bike(bike)
    bike.broken? ? @broken_bikes << bike : @bikes << bike
  end
end
