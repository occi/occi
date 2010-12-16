module Occi
  module Computes
    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body

    def computes_get params = {}
      request.get "/compute", params
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID

    def computes_post params = {}
      request.post "/compute", params
    end
  end
end
