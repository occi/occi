require "occi/resource"

require "occi/compute"
require "occi/network"
require "occi/storage"

require "digest/sha1"
require "hugs"

module Occi
  class Client
    ##
    # Required:
    # +user+: A String containing the username for use in HTTP Basic auth.
    # +password+: A String containing the password for use in HTTP Basic auth.
    # +host+: A String with the host to connect.

    def initialize options
      @connection = Hugs::Client.new(
        :user     => options[:user],
        :password => Digest::SHA1.hexdigest(options[:password]),
        :host     => options[:host],
        :scheme   => options[:scheme] || "http",
        :port     => options[:port] || 4567,
        :type     => options[:type] || :xml,
      )
      @connection.raise_4xx = true
      @connection.raise_5xx = true
    end

    def network
      @network ||= Occi::Network.new @connection
    end

    def storage
      @storage ||= Occi::Storage.new @connection
    end

    def compute
      @compute ||= Occi::Compute.new @connection
    end
  end
end
