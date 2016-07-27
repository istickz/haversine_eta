# == Schema Information
#
# Table name: cars
#
#  id                :integer          not null, primary key
#  number            :string                                 # Номер ТС
#  brand             :string                                 # Марка машины
#  available         :boolean          default: 0            # Статус машины
#  lonlat            :geographic                             # Геопозиция машины
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Car < ActiveRecord::Base
  GEO_FACTORY = RGeo::Geographic.spherical_factory(srid: 4326)

  scope :available, -> { where(available: true) }

  def self.closest(lon, lat, distance: 200000)
    where("ST_DWithin(cars.lonlat, ST_GeographyFromText('SRID=4326;POINT(:lon :lat)'), :distance)", lon: lon, lat: lat, distance: distance)
  end
end

class Distance
  attr_reader :value

  def calc(p1, p2)
    query = <<-SQL
      SELECT ST_Distance(
            ST_Transform(ST_GeomFromText('POINT(:p1lon :p1lat)',4326),26986),
            ST_Transform(ST_GeomFromText('POINT(:p2lon :p2lat)',4326),26986)
          );
    SQL
    sql = ActiveRecord::Base.send(:sanitize_sql_array, [query, {p1lon: p1[0], p1lat: p1[1], p2lon: p2[0], p2lat: p2[1]}])
    res = ActiveRecord::Base.connection.select_one(sql)
    @value = res['st_distance']
  end
end



