module Occi
  class Compute
    def initialize connection
      @connection = connection
    end

    ##
    # Returns the contents of the pool.
    # 200 OK: An XML representation of the pool in the http body.

    def all
      @connection.get "/compute"
    end

    ##
    # Request for the creation of an ER. An XML representation of a
    # VM without the ID element should be passed in the http body.
    # 201 Created: An XML representation of a ER of type COMPUTE with the ID.

    def create builder
      @connection.post "/compute", :body => builder
    end

    ##
    # Returns the representation of the Compute resource identified by +compute_id+.
    # 200 OK: An XML representation of the pool in the http body.

    def find id
      @connection.get "/compute/#{id}"
    end

    ##
    # Deletes the Compute resource identified by +compute_id+.
    # 204 No Content : The Compute has been successfully deleted.

    def delete id
      @connection.delete "/compute/#{id}"
    end

    ##
    # Update request for a Compute identified by +compute_id+.
    # 202 Accepted : The update request is being process, polling required to confirm update.

    def update id, builder
      @connection.put "/compute/#{id}"
    end

  end
end
