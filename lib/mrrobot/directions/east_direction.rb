require_relative 'direction_interface'

module Mrrobot
  class EastDirection
    include DirectionInterface

    def initialize(position)
      @position = position
    end

    def left
      @position.direction = @position.north_direction
    end

    def right
      @position.direction = @position.south_direction
    end

    def forward
      @position.x += 1
    end
  end
end
