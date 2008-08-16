class Opinion < ActiveRecord::Base
  belongs_to :city
  has_one :opinion_photo, :dependent => :destroy

  before_save :assign_idents



  private
    def assign_idents
      self.ident_name = (self.class.find(:first, :select => :ident_name, :conditions => {:ident_num => self.ident_num}).ident_name rescue self.ident_name ) unless self.ident_num.nil?
      self.ident_num = (self.class.maximum(:ident_num) || 0)+1 if self.ident_num.nil?
    end
    
end
