require 'spec_helper'

RSpec.describe Mrrobot::ReportCommand do
  let(:servant) { double('servant') }
  let(:command) { described_class.new(servant: servant, opts: nil) }

  describe '#execute' do
    it 'calls #report on the servant' do
      expect(servant).to receive(:report)
      command.execute
    end
  end
end
