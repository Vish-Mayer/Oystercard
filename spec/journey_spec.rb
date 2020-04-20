require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:camden) {double(name: "camden", zone: 1)}
  let(:euston) {double(name: "euston", zone: 1)}

  it { should respond_to(:entry_station) }
  it { should respond_to(:exit_station) }

  describe '#initialize' do
    it "is initialized with an empty journey history" do
      expect(journey.journey_history).to be_empty
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(journey).not_to be_in_journey
    end
  end

  describe '#start_journey' do
    it "stores the entry station" do
      journey.start_journey(camden)
      expect(journey.entry_station).to eq camden
    end
    it "changes in journey status to true" do
      journey.start_journey(camden)
      expect(journey).to be_in_journey
    end
  end

  describe '#end_journey' do
    it "sets entry station to nil on touch_out" do
      subject.start_journey(camden)
      subject.end_journey(euston)
      expect(journey.entry_station).to eq nil
    end
    it "sets exit station to nil on touch_out" do
      subject.start_journey(camden)
      subject.end_journey(euston)
      expect(journey.exit_station).to eq nil
    end
    it "changes in journey status to true" do
      journey.start_journey(camden)
      subject.end_journey(euston)
      expect(journey).to_not be_in_journey
    end
  end

  describe '#log_journey' do
    it "stores the journey history" do
      journey.start_journey(camden)
      subject.end_journey(euston)
      history = [{:entry_station=> camden, :exit_station=> euston}]
      expect(journey.journey_history).to eq history
    end
  end
end
