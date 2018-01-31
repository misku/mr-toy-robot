require_relative 'command'

module Mrrobot
  class MoveCommand < Command
    def execute
      @servant.move
    end
  end
end
