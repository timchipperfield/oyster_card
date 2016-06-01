require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new}
# In order to use public transport
# As a customer
# I want money on my card

  describe "responds to" do
    it { is_expected.to respond_to(:balance) }

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it { is_expected.to respond_to(:touch_in) }

     it { is_expected.to respond_to(:touch_out) }

  end

  describe '#balance' do

  	it 'has an initial balance of 0' do
  		expect(card.balance).to eq 0
	   end
  end

	describe "#top_up" do

		it "should increase the balance" do
			expect(card.top_up(5)).to be == card.balance
		end

		it 'raises an error if top_up amount would push balance over 90' do
			expect { card.top_up(91) }.to raise_error "Can't add to your balance; would breach the £90 limit"
		end
	end

  describe "#deduct" do

    it "removes money from the balance" do
      expect(card.deduct(20)).to be == card.balance
    end
  end

  describe "#touch_in" do

    it "changes the card to be in_journey" do
      card.touch_in
      expect(card).to be_in_journey
    end
  end

  describe "#touch_out" do
    it "changes the card to not be in_journey" do
     card.touch_in
     card.touch_out
     expect(card).not_to be_in_journey
   end
  end

  describe "#in_journey?" do

    it "returns false if not in journey" do
      expect(card.in_journey?).to eq false
    end

    it "returns true if it is in journey" do
      card.touch_in
      expect(card.in_journey?).to eq true
    end
  end


end




