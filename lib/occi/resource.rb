module Occi
  class Resource
    def initialize connection
      @connection = connection
    end

    def self.inherited base
      path = base.to_s.split('::').last.downcase
      base.send(:define_method, :endpoint) do
        "/#{path}"
      end
    end

    def entity id
      "#{endpoint}/#{id}"
    end

    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body.

    def all
      @connection.get endpoint
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID.

    def create body
      @connection.post endpoint, :body => body
    end

    ##
    # Update request for a Compute identified by +compute_id+.
    # 202 Accepted : The update request is being process, polling required to confirm update.

    def update id, body
      @connection.put entity(id), :body => body
    end

    ##
    # Returns the representation of the Compute resource identified by +compute_id+.
    # 200 OK: An XML representation of the pool in the http body.

    def find id
      @connection.get entity(id)
    end

    ##
    # Deletes the Compute resource identified by +compute_id+.
    # 204 No Content : The Compute has been successfully deleted.

    def destroy id
      @connection.delete entity(id)
    end
  end
end
