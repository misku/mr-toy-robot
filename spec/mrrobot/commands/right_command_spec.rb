require 'spec_helper'

RSpec.describe Mrrobot::RightCommand do
  let(:servant) { double('servant') }
  let(:command) { described_class.new(servant: servant, opts: nil) }

  describe '#execute' do
    it 'calls #right on the servant' do
      expect(servant).to receive(:right)
      command.execute
    end
  end
end
