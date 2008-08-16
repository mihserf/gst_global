class Status < ActiveRecord::Base
  has_many :member_statuses, :dependent => :destroy
  has_many :members, :through => :member_statuses, :dependent => :destroy

  before_save :assign_idents



  private
    def assign_idents
      self.ident_name = (self.class.find(:first, :select => :ident_name, :conditions => {:ident_num => self.ident_num}).ident_name rescue self.ident_name ) unless self.ident_num.nil?
      self.ident_num = (self.class.maximum(:ident_num) || 0)+1 if self.ident_num.nil?
    end
end
