# Write immediately to STDOUT
$stdout.sync = true

require 'singleton'
require 'optparse'

module Mrrobot
  class CLI
    include Singleton

    attr_reader :options

    def initialize
      @options = {}
    end

    def parse(args = ARGV)
      out = parse_opts(args)
      return if opts_valid?

      # Print out help if wrong/no params were passed
      puts out
      exit
    end

    private

    def parse_opts(args)
      parser = OptionParser.new do |opts|
        opts.banner = 'Usage: mrrobot [options]'

        opts.on('-f', '--file FILE', String, 'File with input commands') do |f|
          @options[:file] = f
        end
        opts.on('-h', '--help', 'Prints this help') do
        end
      end
      parser.parse!(args)
      parser.to_s
    end

    def opts_valid?
      @options.key?(:file)
    end
  end
end
