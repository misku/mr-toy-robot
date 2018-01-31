require_relative 'position_interface'
require_relative 'position_with_direction_interface'
require_relative 'directions/east_direction'
require_relative 'directions/north_direction'
require_relative 'directions/south_direction'
require_relative 'directions/west_direction'
require_relative 'directions/null_direction'

module Mrrobot
  class Position
    include PositionInterface
    include PositionWithDirectionInterface

    def initialize
      @east_direction = EastDirection.new(self)
      @north_direction = NorthDirection.new(self)
      @south_direction = SouthDirection.new(self)
      @west_direction = WestDirection.new(self)
      @null_direction = NullDirection.new

      @x = 0
      @y = 0
      @direction = @null_direction
    end

    def setup(x: 0, y: 0, direction: nil)
      # Make sure x, y, and direction are always valid
      self.x = x.to_i
      self.y = y.to_i
      self.direction = direction_for_name(direction)
      self
    end

    def left
      direction.left
    end

    def right
      direction.right
    end

    def forward
      direction.forward
    end

    def to_s
      "#{x}, #{y}, #{direction}"
    end

    def coords
      { x: x, y: y }
    end

    def duplicate
      pos = Position.new
      pos.setup(coords_with_direction)
    end

    private

    def direction_for_name(name)
      direction_string = "@#{name.to_s.downcase}_direction"
      instance_variable_get(direction_string) || @null_direction
    end

    def coords_with_direction
      coords.merge(direction: direction)
    end
  end
end
