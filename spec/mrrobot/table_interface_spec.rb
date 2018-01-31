require 'spec_helper'

RSpec.describe Mrrobot::TableInterface do
  opts = {}
  opts[:instance_methods] = %i[move_possible_to?]
  it_behaves_like('an interface', described_class, opts)

  it 'implements InterfaceHelper' do
    expect(described_class.included_modules
      .include?(Mrrobot::InterfaceHelper)).to be_truthy
  end
end
