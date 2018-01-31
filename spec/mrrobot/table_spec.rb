require 'spec_helper'

RSpec.describe Mrrobot::Table do
  let(:size) { { w: 25, h: 35 } }
  let(:table) { Mrrobot::Table.new(size) }

  it 'implements TableInterface' do
    expect(described_class.included_modules
      .include?(Mrrobot::TableInterface)).to be_truthy
  end

  describe '#move_possible_to?' do
    context 'is possible' do
      let(:new_coords) { { x: 4, y: 10 } }

      it 'returns true' do
        expect(table.move_possible_to?(new_coords)).to be_truthy
      end
    end

    context 'is NOT possible' do
      context 'with values >= the size' do
        let(:new_coords) { { x: 25, y: 303 } }

        it 'returns false' do
          expect(table.move_possible_to?(new_coords)).to be_falsey
        end
      end

      context 'with values < 0' do
        let(:new_coords) { { x: -5, y: 0 } }

        it 'returns false' do
          expect(table.move_possible_to?(new_coords)).to be_falsey
        end
      end
    end
  end
end
