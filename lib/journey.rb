class Journey

  attr_reader :entry_station, :exit_station, :journey_history

  def initialize
    @entry_station
    @exit_station
    @journey_history = []
  end

  def in_journey?
   true if @entry_station != nil
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
    log_journey
    @entry_station, @exit_station = nil
  end

  def log_journey
    @journey_history << {entry_station: @entry_station, exit_station: @exit_station}
  end
end
