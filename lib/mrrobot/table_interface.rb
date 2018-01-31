require_relative 'helpers/interface_helper'

module Mrrobot
  module TableInterface
    include InterfaceHelper

    def move_possible_to?
      raise NoMethodError
    end
  end
end
