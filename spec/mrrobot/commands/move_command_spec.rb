require 'spec_helper'

RSpec.describe Mrrobot::MoveCommand do
  let(:servant) { double('servant') }
  let(:command) { described_class.new(servant: servant, opts: nil) }

  describe '#execute' do
    it 'calls #move on the servant' do
      expect(servant).to receive(:move)
      command.execute
    end
  end
end
