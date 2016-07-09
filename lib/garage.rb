class Garage
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def dock(bikes)
    @bikes.concat(bikes).flatten
    fix_bikes
  end

  def release_bikes
    @bikes.pop(@bikes.count)
  end

  private

  def fix_bikes
    @bikes.each { |bike| bike.fix }
  end

end
