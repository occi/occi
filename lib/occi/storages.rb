module Occi
  module Storages
    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body

    def storages_get params = {}
      request.get "/storage", params
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID

    def storages_post params = {}
      request.post "/storage", params
    end
  end
end
