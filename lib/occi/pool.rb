module Occi
  module Pool
    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body

    %w(computes_get networks_get storages_get).each do |method|
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
    # :method: storages_get
  end
end
