class Occi
  ##
  # Required:
  # +user+: A String containing the username for use in HTTP Basic auth.
  # +password+: A String containing the password for use in HTTP Basic auth.
  # +host+: A String with the host to connect.

  def initialize options
    @connection  = Hugs.new(
      :user      => options[:user],
      :password  => options[:password],
      :host      => options[:host],
      :port      => options[:port] || Some_Port,
    )
  end

  def request
    @connection
  end
end
