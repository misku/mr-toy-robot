require 'spec_helper'

RSpec.describe Mrrobot::PositionInterface do
  opts = {}
  opts[:instance_methods] = %i[setup to_s coords duplicate]
  it_behaves_like('an interface', described_class, opts)
end
