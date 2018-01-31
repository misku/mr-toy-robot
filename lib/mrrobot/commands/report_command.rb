require_relative 'command'

module Mrrobot
  class ReportCommand < Command
    def execute
      @servant.report
    end
  end
end
