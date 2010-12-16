module Occi
  module Networks
    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID

    def networks_post params = {}
      request.post "/network", params
    end
  end
end
