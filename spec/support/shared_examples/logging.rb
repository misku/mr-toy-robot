RSpec.shared_examples_for 'has a logger' do
  let(:logger) { double('logger') }

  before do
    %i[debug info warn error].each do |msg|
      allow(logger).to receive(msg)
    end
  end
end
