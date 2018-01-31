require 'spec_helper'

RSpec.describe Mrrobot::CLI do
  let(:cli) { Mrrobot::CLI.instance }

  before do
    cli.instance_variable_set(:@options, {})
  end

  describe '#parse' do
    context 'with correct parameters' do
      let(:args) { '-f examples/input.file'.split(' ') }

      it 'does not output anything' do
        expect { cli.parse(args) }.not_to output.to_stdout
      end
    end

    context 'with empty parameters' do
      let(:args) { [] }

      it 'outputs help and exits' do
        expect { cli.parse(args) }.to raise_error(SystemExit)
          .and output(/Usage: mrrobot/).to_stdout
      end
    end
  end
end
