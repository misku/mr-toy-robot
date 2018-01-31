RSpec.shared_examples_for 'an interface' do |interface_module, opts|
  let(:dummy_class) do
    Class.new { include interface_module }
  end
  let(:obj) { dummy_class.new }

  it 'raises errors on instance methods' do
    instance_methods = opts&.dig(:instance_methods)
    instance_methods&.each do |method|
      expect { obj.send(method) }
        .to raise_error(NoMethodError)
    end
  end

  it 'raises errors on class methods' do
    class_methods = opts&.dig(:class_methods)
    class_methods&.each do |method|
      expect { interface_module.send(method) }
        .to raise_error(NoMethodError)
    end
  end
end
