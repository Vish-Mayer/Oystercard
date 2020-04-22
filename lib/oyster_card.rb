require_relative 'journey_log'
require_relative 'station'

class Oystercard

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1
  
  attr_reader :balance
  attr_reader :journey

  def initialize
    @balance = 0
    @journey = JourneyLog.new(Journey)
  end


  def top_up(money)
    raise "Maximum balance exceeded" if over?(money)
    @balance += money
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MINIMUM_VALUE
    @journey.start_log(station)
  end

  def touch_out(station)
    @journey.finish_log(station)
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
