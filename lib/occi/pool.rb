module Occi
  module Pool
    ##
    # The _get methods:
    #   Returns the contents of the pool.
    #   200 OK: An XML representation of the pool in the http body.
    #
    # The _post methods:
    #   Request for the creation of an ER. An XML representation of a
    #   VM without the ID element should be passed in the http body.
    #   201 Created: An XML representation of a ER of type COMPUTE with the ID.

    %w(
      computes_get
      computes_post
      networks_get
      networks_post
      storages_get
      storages_post
    ).each do |method|
      define_method method do |*args|
        params     = args[0] || {}
        path, verb = method.split("_")

        request.send verb, "/#{path.sub(%r{s$}, '')}", params
      end
    end

    ##
    # :method: computes_get

    ##
    # :method: networks_get

    ##
    # :method: networks_post

    ##
    # :method: storages_get
  end
end
