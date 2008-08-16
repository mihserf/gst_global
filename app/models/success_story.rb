class SuccessStory < ActiveRecord::Base
  belongs_to :member
  has_one :success_story_photo

  
end
