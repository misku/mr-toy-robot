require_relative '../exceptions'
require_relative 'null_command'
require_relative 'place_command'
require_relative 'move_command'
require_relative 'report_command'
require_relative 'left_command'
require_relative 'right_command'

module Mrrobot
  class CommandFactory
    def create_command(servant:, opts:)
      cmd_string = opts&.dig(:cmd_string)
      cmd = command_for_string(cmd_string)
      cmd_class = Command.const_get(cmd)
      return cmd_class.new(servant: servant, opts: opts)
    rescue ParseError, NameError
      return NullCommand.new(servant: servant, opts: opts)
    end

    private

    def command_for_string(cmd_string)
      command_regex = /^\s*(?<cmd>\w+)\s+.*$/
      parsed_cmd = command_regex.match(cmd_string)
      raise ParseError unless parsed_cmd
      namespace = self.class.to_s.split('::')
      namespace.pop
      "#{namespace.join('::')}::#{parsed_cmd[:cmd].capitalize}Command"
    end
  end
end
