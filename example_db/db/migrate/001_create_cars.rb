class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :number
      t.string :brand
      t.boolean :available, default: false
      t.st_point :lonlat, geographic: true

      t.timestamps null: false
    end

    add_index :cars, :lonlat, using: :gist
  end
end
