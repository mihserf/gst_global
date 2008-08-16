class City < ActiveRecord::Base
  belongs_to :country
  has_many :opinions, :dependent => :destroy
  has_many :members, :dependent => :destroy
  has_many :city_photos, :dependent => :destroy
  has_one :city_coord
  

  before_save :assign_idents
  


  
    def assign_idents
      self.ident_name = (self.class.find(:first, :select => :ident_name, :conditions => {:ident_num => self.ident_num}).ident_name rescue self.ident_name ) unless self.ident_num.nil?
      self.ident_num = (self.class.maximum(:ident_num) || 0)+1 if self.ident_num.nil?
    end

end
