require_relative 'direction_interface'

module Mrrobot
  class SouthDirection
    include DirectionInterface

    def initialize(position)
      @position = position
    end

    def left
      @position.direction = @position.east_direction
    end

    def right
      @position.direction = @position.west_direction
    end

    def forward
      @position.y -= 1
    end
  end
end
