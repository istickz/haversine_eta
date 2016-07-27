class EtaService
  include Garner::Cache::Context
  EXPIRES_TIME = 1.minute
  attr_accessor :lat, :long

  def initialize(options)
    @lat = options['lat']
    @long = options['long']
  end

  def as_json
    #NOTICE Caching in this place is bad way, but this works perfect
    garner.options(expires_in: EXPIRES_TIME) do
      puts "I am Cached NOW #{@lat} #{@long}"
      {eta: calc}
    end
  end

  private

    def calc
      closest_cars = Car.closest(lat, long).limit(3)
      distances = []
      if closest_cars.any?
        closest_cars.each do |car|
          distances << Car.distance([car.lonlat.x, car.lonlat.y], [lat, long])
        end
      end
      eta(distances)
    end

    def eta(distances)
      distances.map{|d| d*1.5}.reduce(:+).to_f / distances.size
    end
end