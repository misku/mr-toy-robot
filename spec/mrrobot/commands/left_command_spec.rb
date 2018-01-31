require 'spec_helper'

RSpec.describe Mrrobot::LeftCommand do
  let(:servant) { double('servant') }
  let(:command) { described_class.new(servant: servant, opts: nil) }

  describe '#execute' do
    it 'calls #left on the servant' do
      expect(servant).to receive(:left)
      command.execute
    end
  end
end
