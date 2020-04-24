# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  subject(:oyster) { described_class.new }
  let(:station) { double(name: 'station', zone: 1) }
  let(:camden) { double(name: 'camden', zone: 1) }
  let(:euston) { double(name: 'camden', zone: 3) }

  describe '#initialize' do
    it 'is initialized with a balance of zero.' do
      expect(oyster.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance value' do
      oyster.top_up 1
      expect(oyster.balance).to eq 1
    end
    it 'raises an error if balance exceeds max value' do
      oyster.top_up(Oystercard::MAXIMUM_VALUE)
      message = 'Maximum balance exceeded'
      expect { oyster.top_up(1) }.to raise_error message
    end
  end

  describe '#touch_in' do
    it 'raises an error if no minimum amount on touch_in' do
      message = 'Insufficient funds'
      expect { oyster.touch_in(station) }.to raise_error message
    end
    it 'raises an error if no minimum amount on touch_in' do
      message = 'Insufficient funds'
      expect { oyster.touch_in(station) }.to raise_error message
    end
    it 'deducts penalty charge if touch in occurs when journey is incomplete ' do
      oyster.top_up(10)
      oyster.touch_in(station)
      oyster.touch_in(station)
      expect(oyster.balance).to eq 6
    end
  end

  describe '#touch_out' do
    it 'dedcucts the minimum balance when travelling in the same zone' do
      oyster.top_up(10)
      oyster.touch_in(station)
      oyster.touch_out(camden)
      expect(oyster.balance).to eq 9
    end
    it 'dedcucts a calculated fare when travelling outside zones' do
      oyster.top_up(10)
      oyster.touch_in(camden)
      oyster.touch_out(euston)
      expect(oyster.balance).to eq 7
    end
  end

  describe '#show_journeys' do
    it 'shows the list of journeys from the journey_log' do
      oyster.top_up(10)
      oyster.touch_in(camden)
      oyster.touch_out(euston)
      journey = [{ touch_in: camden, touch_out: euston }]
      expect(oyster.show_journeys).to eq journey
    end
  end
end
