class Country < ActiveRecord::Base
  has_many :cities, :dependent => :destroy
  has_one :map, :dependent => :destroy

  before_save :assign_idents

#  def to_param
#    "#{ident_name}"
#  end

  
    def assign_idents
      self.ident_name = (self.class.find(:first, :select => :ident_name, :conditions => {:ident_num => self.ident_num}).ident_name rescue self.ident_name ) unless self.ident_num.nil?
      self.ident_num = (self.class.maximum(:ident_num) || 0)+1 if self.ident_num.nil?
    end
end
