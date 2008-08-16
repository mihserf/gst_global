class Member < ActiveRecord::Base
  has_many :member_statuses, :dependent => :destroy
  has_many :statuses, :through => :member_statuses, :dependent => :destroy
  has_one :member_photo, :dependent => :destroy
  has_one :success_story, :dependent => :destroy
  has_one :story, :dependent => :destroy
  belongs_to :city

  before_save :assign_idents


  def name
    last_name+" "+first_name.first
  end

  
    def assign_idents
      self.ident_name = (self.class.find(:first, :select => :ident_name, :conditions => {:ident_num => self.ident_num}).ident_name rescue self.ident_name ) unless self.ident_num.nil?
      self.ident_num = (self.class.maximum(:ident_num) || 0)+1 if self.ident_num.nil?
    end

end
