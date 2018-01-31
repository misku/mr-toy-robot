require_relative 'command'

module Mrrobot
  class LeftCommand < Command
    def execute
      @servant.left
    end
  end
end
