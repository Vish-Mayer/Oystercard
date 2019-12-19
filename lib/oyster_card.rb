class Oystercard

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history
  attr_reader :one_journey

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @one_journey
    @journey_history = []
  end


  def top_up(money)
    raise "Maximum balance exceeded" if over?(money)
    @balance += money
  end

  def in_journey?
   true if @entry_station != nil
  end

  def touch_in(station)
    @entry_station = station
    raise "Insufficient funds" if @balance < MINIMUM_VALUE
  end

  def touch_out(station)
    @exit_station = station
    @one_journey = {entry_station: @entry_station, exit_station: @exit_station}
    @journey_history << @one_journey
    @entry_station = nil
    deduct(MINIMUM_VALUE)
  end

  def over?(money)
    @balance + money > MAXIMUM_VALUE
  end

  private

  def deduct(money)
    @balance -= money
  end
end
