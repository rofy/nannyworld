class Center < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  has_many :wrappers
  has_many :users, :through => :wrappers
  
  validates :name, :address , presence: true
  
  def self.search(search, within)
     if search 
        near( search.to_region, within, :order => :distance)
     else
        scoped
     end 
  end   

 
end
