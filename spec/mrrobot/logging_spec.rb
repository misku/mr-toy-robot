require 'spec_helper'

RSpec.describe Mrrobot::Logging do
  let(:dummy_class) do
    Class.new { include Mrrobot::Logging }
  end

  describe '#logger' do
    it 'calls `logger` class method' do
      expect(Mrrobot::Logging).to receive(:logger)
      dummy_class.new.logger
    end
  end

  describe '.logger' do
    it 'returns a new Logger object' do
      expect(Mrrobot::Logging.logger).to be_instance_of(Logger)
    end
  end
end
