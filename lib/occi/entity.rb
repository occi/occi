module Occi
  module Entity
    Gets = %w(
      compute
      network
      storage
    ).map { |v| "#{v}_get" }.freeze

    Deletes = %w(
      compute
      network
      storage
    ).map { |v| "#{v}_delete" }.freeze

    Puts = %w(
      compute
    ).map { |v| "#{v}_put" }.freeze

    ##
    # The _get methods:
    #   Returns the representation of the Compute resource identified by +compute_id+.
    #   200 OK: An XML representation of the pool in the http body.
    #
    # The _delete methods:
    #   Deletes the Compute resource identified by +compute_id+.
    #   204 No Content : The Compute has been successfully deleted.
    #
    # The _put methods:
    #   Update request for a Compute identified by +compute_id+.
    #   202 Accepted : The update request is being process, polling required to confirm update.

    (Gets + Deletes + Puts).each do |method|
      define_method method do |*args|
        id         = args[0]
        params     = args[1] || {}
        path, verb = method.split("_")

        request.send verb, "/#{path}/#{id}", params
      end
    end

    ##
    # :method: compute_get

    ##
    # :method: compute_delete

    ##
    # :method: compute_put

    ##
    # :method: network_get

    ##
    # :method: network_delete

    ##
    # :method: storage_get

    ##
    # :method: storage_delete
  end
end
