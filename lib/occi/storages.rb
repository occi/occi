module Occi
  module Storages
    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID

    def storages_post params = {}
      request.post "/storage", params
    end
  end
end
