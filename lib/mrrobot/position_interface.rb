module Mrrobot
  module PositionInterface
    attr_accessor :x, :y

    def setup
      raise NoMethodError
    end

    def to_s
      raise NoMethodError
    end

    def coords
      raise NoMethodError
    end

    def duplicate
      raise NoMethodError
    end
  end
end
