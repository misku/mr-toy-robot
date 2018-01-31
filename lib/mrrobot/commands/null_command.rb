require_relative 'command'
require_relative '../logging'

module Mrrobot
  class NullCommand < Command
    include Logging

    def execute
      logger.error "#{name}: unrecognized command: "\
        "\"#{@opts&.dig(:cmd_string)}\""
    end
  end
end
