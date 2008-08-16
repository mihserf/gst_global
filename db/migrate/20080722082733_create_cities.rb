class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name, :lang, :ident_name
      t.text :body
      t.integer :country_id, :num_order
      t.integer :ident_num
      t.timestamps
    end
  end

  def self.down
    drop_table :cities
  end
end
