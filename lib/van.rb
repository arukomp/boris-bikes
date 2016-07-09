class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def load_bikes(bikes)
    bikes.each { |bike| @bikes << bike }
  end

  def unload_bikes
    @bikes.pop(@bikes.count)
  end

end
