RSpec.shared_examples_for 'a direction' do |direction_class, opts|
  let(:position) { Mrrobot::Position.new }
  let(:obj) { position.send(:direction_for_name, opts[:name]) }

  before do
    init_values = { x: 3, y: 2, direction: obj.to_s }
    position.setup(init_values)
  end

  it 'implements DirectionInterface' do
    expect(direction_class.included_modules
      .include?(Mrrobot::DirectionInterface)).to be_truthy
  end

  describe '#left' do
    it "rotates to #{opts[:left_target]}" do
      expect { obj.left }.to change { position.direction }
        .from(obj).to position.send(:direction_for_name, opts[:left_target])
    end
  end

  describe '#right' do
    it "rotates to #{opts[:right_target]}" do
      expect { obj.right }.to change { position.direction }
        .from(obj).to position.send(:direction_for_name, opts[:right_target])
    end
  end

  describe '#forward' do
    it "changes position.#{opts[:coord_type]} by #{opts[:coord_change_val]}" do
      expect { obj.forward }.to change { position.send(opts[:coord_type]) }
        .by(opts[:coord_change_val])
    end
  end

  describe '#to_s' do
    it 'returns direction name' do
      expect(obj.to_s).to eq(opts[:name])
    end
  end
end
