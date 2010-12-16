module Occi
  module Networks
    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body

    def networks_get params = {}
      request.get "/network", params
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID

    def networks_post params = {}
      request.post "/network", params
    end
  end
end
