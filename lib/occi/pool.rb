module Occi
  module Pool
    Gets = {
      :methods => %w(
        computes
        networks
        storages
      ).map { |v| "#{v}_get" },
      :status => 200,
    }.freeze

    Posts = {
      :methods => %w(
        computes
        networks
        storages
      ).map { |v| "#{v}_post" },
      :status => 201,
    }.freeze

    Verbs = Array.new << Gets << Posts

    ##
    # The _get methods:
    #   Returns the contents of the pool.
    #   200 OK: An XML representation of the pool in the http body.
    #
    # The _post methods:
    #   Request for the creation of an ER. An XML representation of a
    #   VM without the ID element should be passed in the http body.
    #   201 Created: An XML representation of a ER of type COMPUTE with the ID.

    Verbs.each do |pairs|
      status = pairs[:status]

      pairs[:methods].each do |method|
        define_method method do |*args|
          params     = args[0] || {}
          path, verb = method.split("_")

          request.send verb, "/#{path.sub(%r{s$}, '')}", params
        end
      end
    end

    ##
    # :method: computes_get

    ##
    # :method: computes_post

    ##
    # :method: networks_get

    ##
    # :method: networks_post

    ##
    # :method: storages_get

    ##
    # :method: storages_post
  end
end
