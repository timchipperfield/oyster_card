
class Oystercard

	attr_reader :balance, :entry_station, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

	def initialize
		@balance = 0
    @journeys = []
	end

	def top_up(amount)
		fail "Can't add to your balance; would breach the £90 limit" if limit_reached?(amount)
		@balance += amount

	end

	def limit_reached?(amount)
		@balance + amount > MAXIMUM_BALANCE
	end

  def touch_in(entry_station)
     fail 'Insufficient funds for journey' if check_funds
     @journeys << Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @journeys.last.set_exit(exit_station)
    deduct(MINIMUM_BALANCE)
  end

  def in_journey?
    if @journeys != []
      @journeys.last.entry_station != nil && @journeys.last.exit_station == nil
    else
      false
    end
  end

  def journeys
    @journeys
  end


  private

  def check_funds
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end
