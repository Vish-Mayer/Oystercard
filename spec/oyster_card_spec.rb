require 'oyster_card'

describe Oystercard do

  let(:card) { Oystercard.new }
  let(:station) { double :station}


  it "raises an error if balance exceeds max value" do
    subject.top_up(Oystercard::MAXIMUM_VALUE)
    message = 'Maximum balance exceeded'
    expect{ subject.top_up(1) }.to raise_error message
  end

  it "dedcucts the minimum balance when touch_out" do
    subject.balance
    subject.touch_out(station)
    expect(subject.balance).to eq -1
  end


  it "raises an error if no minimum amount on touch_in" do
    message = "Insufficient funds"
    expect{ subject.touch_in(station) }.to raise_error message
  end

  it "stores the entry station on touch_in" do
    subject.top_up(1)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

  it "sets entry_station to nil on touch_out" do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.entry_station).to eq nil
  end

  it "stores the exit station on touch_out" do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.exit_station).to eq station
  end

  it "journey_history empty @default" do
    expect(subject.journey_history).to be_empty
  end
  it "one_journey empty @default" do
    expect(subject.one_journey).to be nil
  end


  it "stores the journey history" do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.journey_history).not_to be_empty
  end

  it "touch_in and touch_out creates one journey" do
    subject.top_up(1)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.journey_history).to include(subject.one_journey)
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

  describe '#in_journey' do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it "changes in_journey status to true" do
      subject.top_up(1)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it "changes in_journey status to false" do
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
    end
  end
end
