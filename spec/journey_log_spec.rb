# frozen_string_literal: true

require 'journey_log'

describe JourneyLog do
  subject(:log) { described_class.new(journey_class) }
  let(:camden) { double(name: 'camden', zone: 1) }
  let(:euston) { double(name: 'euston', zone: 1) }
  let(:journey_instance) { double(start_journey: nil, end_journey: nil) }
  let(:journey_class) { double(new: journey_instance) }
  let(:completed_journey) { double(touch_in: camden, touch_out: euston) }
  let(:incomplete_journey) { double(touch_in: euston, touch_out: nil) }

  describe '#initialize' do
    it ' is initialized with a journey class' do
      expect(log.journey_class).to eq journey_class
    end
    it 'is initialized with an empty journey_log' do
      expect(log.journey_log).to be_empty
    end
    it 'is initialized with a new journey instance' do
      expect(log.journey).to eq journey_instance
    end
  end

  describe '#start_log' do
    it 'starts a journey from journey class' do
      allow(journey_instance).to receive(:start_journey).with('camden')
      log.start_log(camden)
    end
  end

  describe '#finish_log' do
    it 'ends a journey from journey class' do
      allow(journey_instance).to receive(:new_journey)
      log.start_log(euston)
      allow(journey_instance).to receive(:end_journey).with('euston')
      log.finish_log(euston)
    end
    it 'adds completed journey hash to journey log' do
      allow(journey_instance).to receive(:new_journey).and_return completed_journey
      log.start_log(camden)
      log.finish_log(euston)
      expect(log.journey_log).to eq log.log_journey
    end
    it 'resets the @journey with a new instance' do
      allow(journey_instance).to receive(:new_journey).and_return completed_journey
      log.start_log(camden)
      log.finish_log(euston)
      expect(log.journey).to eq log.new_journey
    end
  end

  describe '#new_journey' do
    it 'starts a new instance of journey class' do
      expect(log.journey).to eq journey_instance
    end
  end

  describe '#log_journey' do
    it 'stores the journey history' do
      allow(journey_instance).to receive(:new_journey).and_return completed_journey
      log.start_log(camden)
      log.finish_log(euston)
      expect(log.journey_log).to eq [completed_journey]
    end
  end

  describe '#journeys' do
    it 'is a clone of the new journey_log' do
      expect(log.journeys).to eq log.journey_log
    end
  end

  describe '#incomplete?' do
    it 'stores an incomplete_journey' do
      allow(journey_instance).to receive(:new_journey).and_return incomplete_journey
      log.start_log(camden)
      log.log_journey
      expect(log.journey_log).to eq [incomplete_journey]
    end
    it 'starts a new journey instance' do
      allow(journey_instance).to receive(:new_journey).and_return incomplete_journey
      log.start_log(camden)
      log.log_journey
      expect(log.journey).to eq journey_instance
    end
  end
end
