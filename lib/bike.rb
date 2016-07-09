class Bike

  def working?
    !broken?
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def fix
    @broken = false
    true
  end
end
