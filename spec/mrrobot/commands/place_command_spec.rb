require 'spec_helper'

RSpec.describe Mrrobot::PlaceCommand do
  let(:servant) { double('servant') }
  let(:opts) { { cmd_string: 'PLACE 4,6,WEST' } }
  let(:command) { described_class.new(servant: servant, opts: opts) }

  include_examples('has a logger')

  before do
    allow(command).to receive(:logger).and_return(logger)
    allow(servant).to receive(:name).and_return('Batman')
  end

  describe '#execute' do
    context 'parsing passed' do
      it 'calls #place on the servant' do
        expect(servant).to receive(:place)
          .with(x: '4', y: '6', direction: 'west')
        expect(logger).to receive(:info)
          .with(/Placing Batman here:.*4.*6.*west/)
        command.execute
      end
    end

    context 'parsing failed' do
      let(:opts) { { cmd_string: 'You shall not pass!' } }

      it 'logs an error' do
        expect(logger).to receive(:error).with(/cannot be parsed/)
        command.execute
      end
    end
  end
end
