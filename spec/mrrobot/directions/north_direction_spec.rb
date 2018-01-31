require 'spec_helper'

RSpec.describe Mrrobot::NorthDirection do
  opts = {
    name: 'north',
    left_target: 'west',
    right_target: 'east',
    coord_type: :y,
    coord_change_val: 1
  }
  it_behaves_like('a direction', described_class, opts)
end
