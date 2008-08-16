class AddCoordToCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :coord, :text
  end

  def self.down
    remove_column :cities, :coord
  end
end
