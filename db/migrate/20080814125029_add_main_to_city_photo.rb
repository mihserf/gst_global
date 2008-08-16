class AddMainToCityPhoto < ActiveRecord::Migration
  def self.up
    add_column :city_photos, :main, :boolean
  end

  def self.down
    remove_column :city_photos, :main
  end
end
