require 'ffaker'

150.times do
  lat = 54.717261 + rand - 0.5
  long = 55.986889 + rand - 0.5
  Car.create(
    number: FFaker::Vehicle.vin,
    available: rand(0..1),
    lonlat: "POINT(#{long} #{lat})",
    brand: "#{FFaker::Vehicle.make} #{FFaker::Vehicle.model}"
  )
end


