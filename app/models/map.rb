class Map < ActiveRecord::Base
  belongs_to :country
  
  has_attachment  :max_size => 2.megabytes, :content_type => :image, :thumbnails => { :thumb => [50, 50], :view => 'x120' },
    :storage => :file_system, :path_prefix => 'public/photos/maps', :processor => 'ImageScience'
  validates_as_attachment
end
