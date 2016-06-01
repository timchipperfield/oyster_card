
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
    @entry_station = entry_station
    initiate_journey
    record_start_journey(entry_station)
    fail 'Insufficient funds for journey' if check_funds
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    record_end_journey(exit_station)
    store_journey
    @entry_station = nil
    deduct(MINIMUM_BALANCE)
  end

  def in_journey?
    @entry_station != nil
  end

  def journeys
    @journeys
  end


  private

  def initiate_journey
    @single_journey = []
  end

  def record_start_journey(entry_station)
    @single_journey << entry_station
  end

  def record_end_journey(exit_station)
    @single_journey << exit_station
  end

  def store_journey
    @journeys << Hash[*@single_journey]
  end

  def check_funds
    @balance < MINIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end
end
