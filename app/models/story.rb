class Story < ActiveRecord::Base
  belongs_to :member
  has_one :story_photo
end
