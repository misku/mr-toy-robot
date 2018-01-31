require_relative 'command'

module Mrrobot
  class RightCommand < Command
    def execute
      @servant.right
    end
  end
end
