class CityCoord < ActiveRecord::Base
  belongs_to :city
  serialize :coord
end
