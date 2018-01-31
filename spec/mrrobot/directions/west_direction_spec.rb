require 'spec_helper'

RSpec.describe Mrrobot::WestDirection do
  opts = {
    name: 'west',
    left_target: 'south',
    right_target: 'north',
    coord_type: :x,
    coord_change_val: -1
  }
  it_behaves_like('a direction', described_class, opts)
end
