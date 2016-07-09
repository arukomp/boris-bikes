class Garage
  attr_reader :bikes

  def dock(bikes)
    @bikes = bikes
    fix_bikes
  end

  private

  def fix_bikes
    @bikes.each { |bike| bike.fix }
  end

end
