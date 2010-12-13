module Occi
  module Entity
    ##
    # Returns the representation of the network resource identified
    # by +net_id+.
    # 200 OK : An XML representation of the network in the http body.

    def network_get net_id
      request.get "/network/#{net_id}"
    end

    ##
    # Deletes the Network resource identified by +net-id+.
    # 204 No Content: The Network has been successfully deleted.

    def network_delete net_id
      request.delete "/network/#{net_id}"
    end

    ##
    # Returns the representation of the image resource identified
    # by +storage_id+.
    # 200 OK : An XML representation of the image in the http body.

    def storage_get storage_id
      request.get "/storage/#{storage_id}"
    end

    ##
    # Deletes the Image resource identified by +storage_id+.
    # 204 No Content : The image has been successfully deleted.

    def storage_delete
      request.delete "/storage/#{storage_id}"
    end

    ##
    # Returns the representation of the Compute resource identified by +compute_id+.
    # 200 OK : An XML representation of the Compute in the http body.

    def compute_get compute_id
      request.get "/compute/#{compute_id}"
    end

    ##
    # Update request for a Compute identified by +compute_id+.
    # 202 Accepted : The update request is being process, polling required to confirm update.

    def compute_put compute_id
      request.put "/compute/#{compute_id}"
    end

    ##
    # Deletes the Compute resource identified by +compute_id+.
    # 204 No Content : The Compute has been successfully deleted.

    def compute_delete compute_id
      request.delete "/compute/#{compute_id}"
    end
  end
end
