require_relative 'command'
require_relative '../exceptions'
require_relative '../logging'
require_relative '../helpers/hash_helper'

module Mrrobot
  class PlaceCommand < Command
    include Logging
    include HashHelper

    def execute
      place_opts = parse_cmd_string
      @servant.place(place_opts)
      logger.info "#{name}: Placing #{@servant.name} here: #{place_opts}"
    rescue ParseError
      logger.error "#{name}: Place parameters cannot be parsed."
    end

    private

    def parse_cmd_string
      opts_regex = /^\s*\w+\s+(?<x>.*?),\s*(?<y>.*?)\s*,\s*(?<direction>.*)$/

      cmd_opts = opts_regex.match(@opts&.dig(:cmd_string)&.downcase)
      raise ParseError unless cmd_opts
      symbolize_keys(cmd_opts.named_captures)
    end
  end
end
