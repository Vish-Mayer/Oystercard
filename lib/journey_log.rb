# frozen_string_literal: true

require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journey_log, :journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journey_log = []
    new_journey
  end

  def start_log(station)
    @journey.start_journey(station)
  end

  def finish_log(station)
    @journey.end_journey(station)
    log_journey
    new_journey
  end

  def new_journey
    @journey = journey_class.new
  end

  def log_journey
    @journey_log << @journey.new_journey
  end

  def log_incomplete?
    unless @journey.new_journey[:touch_in].nil?
      log_journey
      new_journey
    end
  end
end
