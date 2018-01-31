require 'spec_helper'

RSpec.describe Mrrobot::RobotInterface do
  opts = {}
  opts[:instance_methods] = %i[place move left right report]
  it_behaves_like('an interface', described_class, opts)
end
