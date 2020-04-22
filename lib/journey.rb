class Journey
  attr_reader :new_journey

  def initialize
    @new_journey = {touch_in: nil, touch_out: nil}
  end

  def start_journey(station)
    @new_journey[:touch_in] = station
  end

  def end_journey(station)
    @new_journey[:touch_out] = station
  end

  def in_journey?
    @new_journey[:touch_in] != nil
  end
end
