class EtaService
  attr_accessor :lat, :long

  def initialize(options)
    @lat = options['lat']
    @long = options['long']
  end

  def as_json
    {eta: calc}
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