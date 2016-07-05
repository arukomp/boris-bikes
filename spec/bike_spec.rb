require 'bike.rb'

describe Bike do
  it {expect(Bike.new.respond_to? 'working?').to eq true}
end
