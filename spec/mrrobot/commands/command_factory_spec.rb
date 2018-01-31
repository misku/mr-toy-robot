require 'spec_helper'

RSpec.describe Mrrobot::CommandFactory do
  let(:factory) { described_class.new }

  before do
  end

  describe '#create_command' do
    let(:servant) { double('servant') }
    let(:opts) { { cmd_string: 'PLACE 4,6,WEST' } }

    context 'command found' do
      it 'returns proper command' do
        expect(factory.create_command(servant: servant, opts: opts))
          .to be_kind_of(Mrrobot::PlaceCommand)
      end
    end

    context 'command NOT found' do
      context 'class does not exist' do
        let(:opts) { { cmd_string: 'You shall not pass!' } }

        it 'returns `null` command' do
          expect(factory.create_command(servant: servant, opts: opts))
            .to be_kind_of(Mrrobot::NullCommand)
        end
      end

      context 'command string cannot be passed' do
        let(:opts) { { cmd_string: 'Rick' } }

        it 'returns `null` command' do
          expect(factory.create_command(servant: servant, opts: opts))
            .to be_kind_of(Mrrobot::NullCommand)
        end
      end
    end
  end
end
