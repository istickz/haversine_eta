require 'rodent'
require_relative 'store'
require_relative 'eta_service'
require_relative 'api_listener'

class EtaServer < Rodent::Server
  configure do
    set :connection, 'amqp://guest:guest@localhost'
  end

  run do
    Signal.trap('INT') { Rodent::Server.stop }

    [ApiListener]
  end
end
