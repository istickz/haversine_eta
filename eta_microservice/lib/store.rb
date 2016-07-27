class Car < ActiveRecord::Base
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)

  def self.distance(p1, p2)
    query = <<-SQL
      SELECT ST_Distance(
            ST_Transform(ST_GeomFromText('POINT(:p1lat :p1long)',4326),26986),
            ST_Transform(ST_GeomFromText('POINT(:p2lat :p2long)',4326),26986)
          );
    SQL
    sql = ActiveRecord::Base.send(:sanitize_sql_array, [query, {p1lat: p1[0], p1long: p1[1], p2lat: p2[0], p2long: p2[1]}])
    res = Car.connection.select_all(sql)
    res.first['st_distance']
  end

  def self.closest(latitude, longitude, distance: 200000)
    where("ST_DWithin(cars.lonlat, ST_GeographyFromText('SRID=4326;POINT(:lon :lat)'), :distance)", lon: longitude, lat: latitude, distance: distance)
  end
end





