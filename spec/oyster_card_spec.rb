# frozen_string_literal: true

require 'oyster_card'

describe Oystercard do
  subject(:oyster) { described_class.new }
  let(:station) { double :station }

  it 'raises an error if balance exceeds max value' do
    oyster.top_up(Oystercard::MAXIMUM_VALUE)
    message = 'Maximum balance exceeded'
    expect { oyster.top_up(1) }.to raise_error message
  end

  it 'raises an error if no minimum amount on touch_in' do
    message = 'Insufficient funds'
    expect { oyster.touch_in(station) }.to raise_error message
  end

  describe '#balance' do
    it 'has a balance of 0' do
      expect(oyster.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance value' do
      oyster.top_up 1
      expect(oyster.balance).to eq 1
    end
  end

  describe '#touch_in' do
    it 'raises an error if no minimum amount on touch_in' do
      message = 'Insufficient funds'
      expect { oyster.touch_in(station) }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'dedcucts the minimum balance when touch_out' do
      oyster.touch_out(station)
      expect(oyster.balance).to eq -1
    end
  end

  describe '#multiple_touch_in' do
    it 'deducts penalty charge if touch in occurs when journey is incomplete ' do
      oyster.top_up(10)
      oyster.touch_in(station)
      oyster.touch_in(station)
      expect(oyster.balance).to eq 6
    end
  end

  describe '#multiple_touch_out' do
    it 'deducts penalty charge if touch out occurs when journey is complete ' do
      oyster.top_up(10)
      oyster.touch_out(station)
      expect(oyster.balance).to eq 6
    end
  end
end
