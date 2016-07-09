require 'bike'
describe Bike do
  it {is_expected.to respond_to (:working?)}

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it 'can be fixed' do
    subject.report_broken
    expect(subject.fix).to eq true
    expect(subject).to_not be_broken
  end

end
