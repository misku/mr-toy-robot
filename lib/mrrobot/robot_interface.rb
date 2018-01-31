require_relative 'table'

module Mrrobot
  module RobotInterface
    attr_reader :name
    attr_accessor :table

    def place
      raise NoMethodError
    end

    def move
      raise NoMethodError
    end

    def left
      raise NoMethodError
    end

    def right
      raise NoMethodError
    end

    def report
      raise NoMethodError
    end
  end
end
