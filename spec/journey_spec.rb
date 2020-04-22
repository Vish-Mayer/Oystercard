require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:camden) {double(name: "camden", zone: 1)}
  let(:euston) {double(name: "euston", zone: 1)}

  describe '#initialize' do
    it "is initialized with an empty journey hash" do
      expect(journey.new_journey).to eq ({:touch_in => nil, :touch_out => nil})
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(journey.in_journey?).to be false 
    end
  end

  describe '#start_journey' do
    it "stores the entry station" do
      journey.start_journey(camden)
      expect(journey.new_journey[:touch_in]).to eq camden
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
      expect(journey.new_journey[:touch_out]).to eq euston
    end
  end
end
