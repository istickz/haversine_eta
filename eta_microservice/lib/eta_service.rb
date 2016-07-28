class EtaService
  include Garner::Cache::Context
  attr_accessor :lon, :lat

  EXPIRES_TIME = 1.minute.freeze

  def initialize(options)
    @lon = options['lon']
    @lat = options['lat']
  end

  def as_json
    #NOTICE Caching in this place is bad way, but this works perfect
    garner.options(expires_in: EXPIRES_TIME).key({lon: lon, lat: lat}) do
      {eta: calc}
    end
  end

  private

    def calc
      closest_cars = Car.available.closest(lon, lat).limit(3)
      distances = []
      if closest_cars.any?
        closest_cars.each do |car|
          distance = Distance.new
          distance.calc([car.lonlat.x, car.lonlat.y], [lon, lat])
          distances << distance.value
        end
      end
      eta(distances)
    end

    def eta(distances)
      if distances.size > 0
        distances.map{|d| d*1.5}.reduce(:+).to_f / distances.size
      end
    end
end
