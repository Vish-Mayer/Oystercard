# frozen_string_literal: true

class Station
  attr_reader :name
  attr_reader :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
