require 'spec_helper'

RSpec.describe Mrrobot::NullCommand do
  let(:opts) { { cmd_string: 'Super secret command' } }
  let(:command) { described_class.new(servant: nil, opts: opts) }

  include_examples('has a logger')

  before do
    allow(command).to receive(:logger).and_return(logger)
  end

  describe '#execute' do
    it 'logs an error' do
      expect(logger).to receive(:error).with(/unrecognized command.*secret/)
      command.execute
    end
  end
end
