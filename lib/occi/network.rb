module Occi
  module Network
    ##
    # Returns the representation of the network resource identified
    # by +net_id+.
    # 200 OK : An XML representation of the network in the http body.

    def network_get net_id, params = {}
      request.get "/network/#{net_id}", params
    end

    ##
    # Deletes the Network resource identified by +net-id+.
    # 204 No Content: The Network has been successfully deleted.

    def network_delete net_id, params = {}
      request.delete "/network/#{net_id}", params
    end
  end
end
