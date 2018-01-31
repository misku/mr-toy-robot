require 'spec_helper'

RSpec.describe Mrrobot::InterfaceHelper do
  let(:dummy_class) do
    Class.new { include Mrrobot::InterfaceHelper }
  end
  let(:obj) { dummy_class.new }

  describe '#implements_interfaces?' do
    let(:interfaces) { [Comparable, Enumerable] }

    context 'implements interfaces' do
      let(:dummy_class) do
        Class.new do
          include Mrrobot::InterfaceHelper
          include Comparable
          include Enumerable
        end
      end

      it 'returns true' do
        expect(obj.implements_interfaces?(interfaces)).to be_truthy
      end
    end

    context 'does NOT implement interfaces' do
      it 'returns false' do
        expect(obj.implements_interfaces?(interfaces)).to be_falsey
      end
    end
  end
end
