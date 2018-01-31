module Mrrobot
  class Command
    def initialize(servant:, opts:)
      @servant = servant
      @opts = opts
    end

    def execute
      raise NoMethodError
    end

    private

    def name
      self.class.to_s
    end
  end
end
