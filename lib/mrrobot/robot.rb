require_relative 'robot_interface'
require_relative 'position'
require_relative 'table'

module Mrrobot
  class Robot
    include RobotInterface
    include Logging

    def initialize(name)
      @name = name
      @position = Position.new
    end

    def place(position_opts)
      @position.setup(position_opts)
    end

    def move
      if move_possible?
        logger.warn "#{name}: Moving forward. Make way!"
        @position.forward
      else
        logger.warn "#{name}: I won't move. Lick my battery!"
      end
    end

    def left
      logger.info "#{name}: Turning left."
      @position.left
    end

    def right
      logger.info "#{name}: Turning right."
      @position.right
    end

    def report
      logger.info "#{name}: I'm right here: #{@position}."
    end

    private

    def move_possible?
      return false unless on_a_table?
      new_position = @position.duplicate
      new_position.forward
      table.move_possible_to?(new_position.coords)
    end

    def on_a_table?
      table.implements_interfaces?([Mrrobot::TableInterface])
    end
  end
end
