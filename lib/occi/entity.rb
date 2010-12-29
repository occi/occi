require "occi/status"

module Occi
  module Entity
    Gets = {
      :methods => %w(
        compute
        network
        storage
      ).map { |v| "#{v}_get" },
      :status => 200,
    }.freeze

    Deletes = {
      :methods => %w(
        compute
        network
        storage
      ).map { |v| "#{v}_delete" },
      :status => 204,
    }.freeze

    Puts = {
      :methods => %w(
        compute
      ).map { |v| "#{v}_put" },
      :status => 202,
    }.freeze

    Verbs = Array.new << Gets << Deletes << Puts

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

    Verbs.each do |pairs|
      expected_status = pairs[:status]

      pairs[:methods].each do |method|
        define_method method do |*args|
          id         = args[0]
          params     = args[1] || {}
          path, verb = method.split("_")

          req = request.send verb, "/#{path}/#{id}", params
          Status.validate expected_status, req.code
          req
        end
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
