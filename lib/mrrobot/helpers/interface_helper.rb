require 'set'

module Mrrobot
  module InterfaceHelper
    def implements_interfaces?(interfaces)
      interfaces.to_set.subset?(self.class.included_modules.to_set)
    end
  end
end
