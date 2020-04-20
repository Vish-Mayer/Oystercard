require 'oyster_card'

describe Oystercard do

  let(:card) { Oystercard.new }
  let(:station) { double :station}

  it "raises an error if balance exceeds max value" do
    subject.top_up(Oystercard::MAXIMUM_VALUE)
    message = 'Maximum balance exceeded'
    expect{ subject.top_up(1) }.to raise_error message
  end

  it "raises an error if no minimum amount on touch_in" do
    message = "Insufficient funds"
    expect{ subject.touch_in(station) }.to raise_error message
  end

  describe '#balance' do
    it "has a balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'increases the balance value' do
      subject.top_up 1
      expect(subject.balance).to eq 1
    end
  end

  describe '#touch_in' do
    it "raises an error if no minimum amount on touch_in" do
      message = "Insufficient funds"
      expect{ subject.touch_in(station) }.to raise_error message
    end
  end

  describe '#touch_out' do
    it "dedcucts the minimum balance when touch_out" do
      subject.touch_out(station)
      expect(subject.balance).to eq -1
    end
  end
end
