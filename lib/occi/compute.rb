module Occi
  module Compute
    ##
    # Returns the representation of the Compute resource identified by +compute_id+.
    # 200 OK : An XML representation of the Compute in the http body.

    def compute_get compute_id, params = {}
      request.get "/compute/#{compute_id}", params
    end

    ##
    # Update request for a Compute identified by +compute_id+.
    # 202 Accepted : The update request is being process, polling required to confirm update.

    def compute_put compute_id, params = {}
      request.put "/compute/#{compute_id}", params
    end

    ##
    # Deletes the Compute resource identified by +compute_id+.
    # 204 No Content : The Compute has been successfully deleted.

    def compute_delete compute_id, params = {}
      request.delete "/compute/#{compute_id}", params
    end
  end
end
