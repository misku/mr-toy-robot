require 'spec_helper'

RSpec.describe Mrrobot::NullDirection do
  let(:direction) { Mrrobot::NullDirection.new }
  include_examples('has a logger')

  before do
    allow(direction).to receive(:logger).and_return(logger)
  end

  it 'implements DirectionInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::DirectionInterface)).to be_truthy
  end

  %i[left right forward].each do |method|
    describe "##{method}" do
      it "will not perform #{method}" do
        expect(logger).to receive(:warn).with(/no.*#{method}.*for you/)
        direction.send(method)
      end
    end
  end

  describe '#to_s' do
    it 'returns direction name' do
      expect(direction.to_s).to eq('null')
    end
  end
end
