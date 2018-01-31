require 'spec_helper'

RSpec.describe Mrrobot::Position do
  let(:position) { Mrrobot::Position.new }
  let(:direction) { 'East' }
  let(:opts) { { x: 1, y: 2, direction: direction } }
  let(:direction_instance) { position.send(:direction_for_name, direction) }

  it 'implements PositionInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::PositionInterface)).to be_truthy
  end

  it 'implements PositionWithDirectionInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::PositionWithDirectionInterface)).to be_truthy
  end

  describe '#setup' do
    context 'with valid values' do
      it 'assigns them to data members' do
        position.setup(opts)
        expect(position.x).to eq(1)
        expect(position.y).to eq(2)
        expect(position.direction).to be_a_kind_of(Mrrobot::EastDirection)
      end
    end

    context 'with INvalid values' do
      it 'assigns default values to data members' do
        position.setup
        expect(position.x).to eq(0)
        expect(position.y).to eq(0)
        expect(position.direction).to be_a_kind_of(Mrrobot::NullDirection)
      end
    end
  end

  context 'state methods' do
    state_methods = %i[left right forward]

    before do
      opts[:direction] = direction
      position.setup(opts)
    end

    state_methods.each do |method|
      describe "##{method}" do
        it "deletages ##{method} to current state" do
          expect(direction_instance).to receive(method)
          position.send(method)
        end
      end
    end
  end

  describe '#to_s' do
    it 'returns `position with direction` string' do
      position.setup(opts)
      expect(position.to_s).to eq('1, 2, east')
    end
  end

  describe '#coords' do
    it 'returns coordinates hash' do
      position.setup(opts)
      expect(position.coords).to eq(x: 1, y: 2)
    end
  end

  describe '#duplicate' do
    it 'returns a duplicate position' do
      new_pos = position.duplicate
      expect(position).not_to eq(new_pos)
      expect(position.to_s).to eq(new_pos.to_s)
    end
  end
end
