require 'spec_helper'

RSpec.describe Mrrobot::NullRobot do
  let(:robot) { described_class.new }

  include_examples('has a logger')

  before do
    allow(robot).to receive(:logger).and_return(logger)
  end

  %i[place move left right report].each do |method|
    describe "##{method}" do
      it "will not perform #{method}" do
        expect(logger).to receive(:warn).with(/NullRobot/)
        robot.send(method)
      end
    end
  end
end
