require 'spec_helper'

RSpec.describe Mrrobot::ReaderInterface do
  opts = {}
  opts[:class_methods] = %i[each_line]
  it_behaves_like('an interface', described_class, opts)
end
