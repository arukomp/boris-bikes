module BikeContainer

  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bikes
    @bikes.pop(@bikes.count)
  end

  def dock(bikes)
    raise 'Capacity full' if full?
    [bikes].flatten.each { |bike| @bikes << bike }
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
