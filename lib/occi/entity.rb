module Occi
  module Entity
    ##
    # The _get methods (compute_get, network_get, storage_get):
    #   Returns the representation of the Compute resource identified by +compute_id+.
    #   200 OK: An XML representation of the pool in the http body.
    #
    # The _delete methods (compute_delete, network_delete, storage_delete):
    #   Deletes the Compute resource identified by +compute_id+.
    #   204 No Content : The Compute has been successfully deleted.
    #
    # The _put methods (compute_put):
    #   Update request for a Compute identified by +compute_id+.
    #   202 Accepted : The update request is being process, polling required to confirm update.

    {:get    => Occi::Paths,
     :delete => Occi::Paths,
     :put    => %w{ compute }}.each_pair do |verb, paths|
      paths.each do |path|
        define_method "#{path}_#{verb}" do |*args|
          request.send verb, "/#{path}/#{args.shift}", (args.shift || {})
        end
     end
    end
  end
end
