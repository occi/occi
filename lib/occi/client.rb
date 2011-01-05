require "hugs"
require "digest/sha1"

module Occi
  class Client
    ##
    # Include endpoints.

    %w(pool entity).each do |mixin|
      require "occi/#{mixin}"
      include eval "Occi::#{mixin.capitalize}"
    end

    ##
    # Required:
    # +user+: A String containing the username for use in HTTP Basic auth.
    # +password+: A String containing the password for use in HTTP Basic auth.
    # +host+: A String with the host to connect.

    def initialize options
      @connection = Hugs::Client.new(
        :user     => options[:user],
        :password => Digest::SHA1.hexdigest options[:password],
        :host     => options[:host],
        :scheme   => options[:scheme] || "http",
        :port     => options[:port] || 4567,
        :type     => options[:type] || :xml,
      )
      @connection.raise_4xx
      @connection.raise_5xx
    end

    def request
      @connection
    end
  end
end
