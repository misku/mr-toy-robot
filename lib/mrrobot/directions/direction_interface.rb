require_relative '../helpers/interface_helper'

module Mrrobot
  module DirectionInterface
    include InterfaceHelper

    def left
      raise NoMethodError
    end

    def right
      raise NoMethodError
    end

    def forward
      raise NoMethodError
    end

    def to_s
      /::(?<name>[A-Z][a-z]+)/.match(self.class.to_s)[:name].downcase
    end
  end
end
