class Wrapper < ActiveRecord::Base
  belongs_to :user
  belongs_to :center
  has_one :evidence
  

                  
 
end
