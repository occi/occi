module Occi
  module Storage
    ##
    # Returns the representation of the image resource identified
    # by +storage_id+.
    # 200 OK : An XML representation of the image in the http body.

    def storage_get storage_id, params = {}
      request.get "/storage/#{storage_id}", params
    end

    ##
    # Deletes the Image resource identified by +storage_id+.
    # 204 No Content : The image has been successfully deleted.

    def storage_delete storage_id, params = {}
      request.delete "/storage/#{storage_id}", params
    end
  end
end
