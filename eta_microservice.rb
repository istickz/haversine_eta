require 'rodent'
require 'json'
class Eta
  attr_accessor :lat, :long

  def initialize(options)
    @lat = options['lat']
    @long= options['long']
  end

  def as_json
    {eta: calc}
  end

  private
  def calc
    (lat + long).to_f
  end
end

class EtaAPI < Rodent::Base
  listen 'eta.calc' do
    self.status = 200
    eta = Eta.new(params)
    eta.as_json
  end
end

class EtaServer < Rodent::Server
  configure do
    set :connection, 'amqp://guest:guest@localhost'
  end

  run do
    Signal.trap('INT') { Rodent::Server.stop }

    [EtaAPI]
  end
end