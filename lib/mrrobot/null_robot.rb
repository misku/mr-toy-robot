require_relative 'robot_interface'

module Mrrobot
  class NullRobot
    include RobotInterface
    include Logging

    def place
      logger.warn "#{name}: Place youself!"
    end

    def move
      logger.warn "#{name}: Ain't gonna move!"
    end

    def left
      logger.warn "#{name}: You socialist!"
    end

    def right
      logger.warn "#{name}: You capitalist!"
    end

    def report
      logger.warn "#{name}: I'm nowhere and everywhere."
    end

    private

    def name
      self.class.to_s
    end
  end
end
