require_relative 'table_interface'

module Mrrobot
  class Table
    include TableInterface

    def initialize(w: 0, h: 0)
      @width = w.to_i
      @height = h.to_i
    end

    def move_possible_to?(coords)
      x = coords.dig(:x)&.to_i
      y = coords.dig(:y)&.to_i
      return false unless x && y
      return true if
        x >= 0 &&
        y >= 0 &&
        x < @width &&
        y < @height
      false
    end
  end
end
