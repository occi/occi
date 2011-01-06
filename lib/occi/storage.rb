module Occi
  class Storage
    def initialize connection
      @connection = connection
    end

    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body.

    def all
      @connection.get "/storage"
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID.

    def create upload
      @connection.post "/storage", :upload => upload
    end
  end
end
