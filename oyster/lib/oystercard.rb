
class Oystercard

	attr_reader :balance, :entry_station
  
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

	def initialize
		@balance = 0
    @in_journey = false
	end

	def top_up(amount)
		fail "Can't add to your balance; would breach the £90 limit" if limit_reached?(amount)
		@balance += amount
	end

	def limit_reached?(amount)
		@balance + amount > MAXIMUM_BALANCE
	end

  def touch_in(entry_station)
    @entry_station = entry_station
    fail 'Insufficient funds for journey' if check_funds
    @in_journey = true
  end

  def touch_out
    @entry_station = nil
    deduct(1)
    @in_journey = false
  end

  def in_journey?

  end

  private

  def check_funds
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end
