require "hugs"

module Occi
  class Client
    ##
    # Include endpoints.

    #%w(compute network storage).each do |mixin|
    %w(pool).each do |mixin|
      require "occi/#{mixin}"
      include eval "::Occi::#{mixin.capitalize}"
    end

    ##
    # Required:
    # +user+: A String containing the username for use in HTTP Basic auth.
    # +password+: A String containing the password for use in HTTP Basic auth.
    # +host+: A String with the host to connect.

    def initialize options
      @connection = ::Hugs.new(
        :user     => options[:user],
        :password => options[:password],
        :host     => options[:host],
        :scheme   => options[:scheme] || "http",
        :port     => options[:port] || 4567,
        :type     => options[:type] || :xml,
      )
    end

    def request
      @connection
    end
  end
end
