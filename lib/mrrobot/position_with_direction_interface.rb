module Mrrobot
  module PositionWithDirectionInterface
    attr_accessor :direction
    attr_reader :north_direction
    attr_reader :east_direction
    attr_reader :south_direction
    attr_reader :west_direction

    def left
      raise NoMethodError
    end

    def right
      raise NoMethodError
    end

    def forward
      raise NoMethodError
    end
  end
end
