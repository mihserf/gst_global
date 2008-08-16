class OpinionPhoto < ActiveRecord::Base
  belongs_to :opinion

  has_attachment  :max_size => 2.megabytes, :content_type => :image, :resize_to => '420x300>',   :thumbnails => { :thumb => [50, 50], :view => 'x100' },
    :storage => :file_system, :path_prefix => 'public/photos/opinions', :processor => 'ImageScience'
  validates_as_attachment
  
end
