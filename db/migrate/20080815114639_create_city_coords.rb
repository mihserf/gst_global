class CreateCityCoords < ActiveRecord::Migration
  def self.up
    create_table :city_coords do |t|
      t.integer :city_id
      t.integer :city_ident_num
      t.text :coord

      t.timestamps
    end
  end

  def self.down
    drop_table :city_coords
  end
end
