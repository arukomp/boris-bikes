class Garage
  include BikeContainer

  def dock(bikes)
    raise 'Capacity full' if full?
    [bikes].flatten.each { |bike| @bikes << bike }
    fix_bikes
  end

  private

  def fix_bikes
    @bikes.each { |bike| bike.fix }
  end

end
