require 'spec_helper'

RSpec.describe Mrrobot::SouthDirection do
  opts = {
    name: 'south',
    left_target: 'east',
    right_target: 'west',
    coord_type: :y,
    coord_change_val: -1
  }
  it_behaves_like('a direction', described_class, opts)
end
