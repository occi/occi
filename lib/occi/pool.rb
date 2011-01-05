module Occi
  module Pool
    ##
    # The _get methods (computes_get, networks_get, storages_get):
    #   Returns the contents of the pool.
    #   200 OK: An XML representation of the pool in the http body.
    #
    # The _post methods (computes_post, networks_post, storages_post):
    #   Request for the creation of an ER. An XML representation of a
    #   VM without the ID element should be passed in the http body.
    #   201 Created: An XML representation of a ER of type COMPUTE with the ID.

    {:get  => Occi::Paths,
     :post => Occi::Paths}.each_pair do |verb, paths|
      paths.each do |path|
        define_method "#{path}s_#{verb}" do |*args|
          request.send verb, "/#{path}", (args.shift || {})
        end
      end
    end
  end
end
