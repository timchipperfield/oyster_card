require 'oystercard'

describe Oystercard do

	it { is_expected.to respond_to(:balance) }

  it "should have a balance at initialization" do
    expect(subject.balance).to eq 0
  end

end