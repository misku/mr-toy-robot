require_relative 'direction_interface'
require_relative '../logging'

module Mrrobot
  class NullDirection
    include DirectionInterface
    include Logging

    def left
      logger.warn "#{name}: no left rotation for you."
    end

    def right
      logger.warn "#{name}: no right rotation for you."
    end

    def forward
      logger.warn "#{name}: no moving forward for you."
    end

    private

    def name
      'NullDirection'
    end
  end
end
