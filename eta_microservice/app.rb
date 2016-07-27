require_relative 'config/boot'

class EtaServer < Rodent::Server
  configure do
    set :connection, 'amqp://guest:guest@localhost'
  end

  run do
    Signal.trap('INT') { Rodent::Server.stop }

    [ApiListener]
  end
end
