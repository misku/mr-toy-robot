require 'spec_helper'

RSpec.describe Mrrobot::Robot do
  let(:name) { 'Optimus Prime' }
  let(:robot) { Mrrobot::Robot.new(name) }
  let(:table) { double('table') }
  let(:position) { double('position') }
  let(:new_position) { double('new_position') }

  include_examples('has a logger')

  before do
    allow(robot).to receive(:logger).and_return(logger)
    allow(robot).to receive(:table).and_return(table)
    allow(table).to receive_messages(
      implements_interfaces?: true,
      move_possible_to?: true
    )
    allow(position).to receive_messages(
      duplicate: new_position
    )
    allow(new_position).to receive_messages(
      forward: nil,
      coords: nil
    )
    robot.instance_variable_set(:@position, position)
  end

  it 'implements RobotInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::RobotInterface)).to be_truthy
  end

  describe '#place' do
    let(:position_opts) { { x: 1, y: 2, direction: 'east' } }

    it 'calls setup on a @position' do
      expect(position).to receive(:setup).with(position_opts)
      robot.place(position_opts)
    end
  end

  describe '#move' do
    context 'is possible' do
      it 'moves forward' do
        expect(position).to receive(:forward)
        robot.move
      end
    end

    context 'is NOT possible' do
      before do
        allow(robot).to receive(:move_possible?).and_return(false)
      end

      it 'does nothing' do
        expect(position).not_to receive(:forward)
        robot.move
      end
    end
  end

  %i[left right].each do |method|
    describe "##{method}" do
      it "moves #{method}" do
        expect(position).to receive(method)
        robot.send(method)
      end
    end
  end

  describe '#report' do
    it 'reports the position' do
      expect(logger).to receive(:info).with(/right here/)
      robot.report
    end
  end
end
