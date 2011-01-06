module Occi
  class Storage < Resource
    def create upload
      @connection.post endpoint, :upload => upload
    end
  end
end
