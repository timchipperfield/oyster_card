require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new}
# In order to use public transport
# As a customer
# I want money on my card
  describe '#balance' do

  	it { is_expected.to respond_to(:balance) }

  	it 'has an initial balance of 0' do
  		expect(card.balance).to eq 0
	   end
  end

	describe "#top_up" do

		it { is_expected.to respond_to(:top_up).with(1).argument }

		it "should increase the balance" do
			expect(card.top_up(5)).to be == card.balance
		end

		it 'raises an error if top_up amount would push balance over 90' do
			expect { card.top_up(91) }.to raise_error "Can't add to your balance; would breach the £90 limit"
		end
	end

  describe "#deduct" do

    it "is expected to respond to #deduct with 1 argument" do
      expect(card).to respond_to(:deduct).with(1).argument
    end

    it "removes money from the balance" do
      expect(card.deduct(20)).to be == card.balance
    end
  end
end
