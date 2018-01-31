require 'spec_helper'

RSpec.describe Mrrobot::DirectionInterface do
  opts = {}
  opts[:instance_methods] = %i[left right forward]
  it_behaves_like('an interface', described_class, opts)
end
