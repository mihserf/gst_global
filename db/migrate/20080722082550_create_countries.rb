class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, :lang, :ident_name
      t.text :body
      t.integer :num_order
      t.integer :ident_num
      t.timestamps
    end
  end

  def self.down
    drop_table :countries
  end
end
