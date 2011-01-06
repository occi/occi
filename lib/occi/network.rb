module Occi
  class Network
    def initialize connection
      @connection = connection
    end

    def all
      @connection.get "/network"
    end

    def create builder
      @connection.post "/network", :body => builder
    end
  end
end
