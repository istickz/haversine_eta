class EtaService
  attr_accessor :lat, :long

  def initialize(options)
    @lat = options['lat']
    @long= options['long']
  end

  def as_json
    {eta: 'ETA VALUE'}
  end

  private
  def calc
    (lat + long).to_f
  end
end