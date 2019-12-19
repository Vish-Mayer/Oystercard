class Oystercard

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @journey = false

  end

  def top_up(money)
    raise "Maximum balance exceeded" if over?(money)
    @balance += money
  end

  def in_journey?
    @journey
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_VALUE
    @journey = true
  end

  def touch_out
    deduct(MINIMUM_VALUE)
    @journey = false
  end

  def over?(money)
    @balance + money > MAXIMUM_VALUE
  end

  private

  def deduct(money)
    @balance -= money
  end
end
