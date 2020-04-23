# frozen_string_literal: true

require 'station'

describe Station do
  subject { described_class.new('Bla Bla bla', 1) }

  it 'has a station name' do
    expect(subject.name).to eq 'Bla Bla bla'
  end

  it 'has a zone' do
    expect(subject.zone).to eq 1
  end
end
