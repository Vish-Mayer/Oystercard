# frozen_string_literal: true

require_relative 'journey_log'
require_relative 'station'

class Oystercard
  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1
  PENALTY_CHARGE = 4

  attr_reader :balance
  attr_reader :journey_log

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(Journey)
  end

  def top_up(money)
    raise 'Maximum balance exceeded' if over?(money)

    @balance += money
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_VALUE

    multiple_touch_in
    @journey_log.start_log(station)
  end

  def touch_out(station)
    @journey_log.finish_log(station)
    deduct(MINIMUM_VALUE)
  end

  private

  def multiple_touch_in
    deduct(PENALTY_CHARGE) if journey_log.log_incomplete?
  end

  def over?(money)
    @balance + money > MAXIMUM_VALUE
  end

  def deduct(money)
    @balance -= money
  end
end
