class Occi::InvalidStatus < StandardError; end

module Occi
  class Status
    def self.validate expected, received
      raise InvalidStatus.new("Expected:#{expected} Received:#{received}") if expected != received.to_i
    end
  end
end
