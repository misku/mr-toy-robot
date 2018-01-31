require 'spec_helper'

RSpec.describe Mrrobot::Command do
  let(:command) { described_class.new(servant: nil, opts: nil) }

  describe '#execute' do
    it 'raises an error' do
      expect { command.execute }.to raise_error(NoMethodError)
    end
  end
end
