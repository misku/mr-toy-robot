require 'spec_helper'

RSpec.describe Mrrobot::EastDirection do
  opts = {
    name: 'east',
    left_target: 'north',
    right_target: 'south',
    coord_type: :x,
    coord_change_val: 1
  }
  it_behaves_like('a direction', described_class, opts)
end
