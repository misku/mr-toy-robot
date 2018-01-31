require_relative 'cli'
require_relative 'table'
require_relative 'robot'
require_relative 'null_robot'
require_relative 'file_reader'
require_relative 'commands/command_factory'

module Mrrobot
  class App
    def self.run
      cli = Mrrobot::CLI.instance
      cli.parse
      cmdline_opts = cli.options

      table = Table.new(w: 5, h: 5)
      mr_robot = Robot.new('Optimus Prime')
      mr_robot.table = table
      command_factory = CommandFactory.new

      FileReader.each_line(cmdline_opts&.dig(:file)) do |line|
        command_factory.create_command(
          servant: mr_robot,
          opts: { cmd_string: line.strip }
        ).execute
      end
    end
  end
end
