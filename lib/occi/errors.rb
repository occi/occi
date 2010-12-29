module Occi
  module Errors
    class Error < StandardError; end

    class HTTPStatusError < Error
      def initialize msg
        super msg
      end
    end

    def self.occurred expected, received
      if expected != received.to_i
        raise HTTPStatusError.new "Expected:#{expected} Received:#{received}"
      end
    end
  end
end
