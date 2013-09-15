

FactoryGirl.define do 
  factory :center do |f| 
    f.name "Early Horizons" 
    f.address "1510 Lewsiton Dr, Sunnyvale CA"
  end 
  
  factory :invalid_center, parent: :center do |f|
     f.name nil
     f.address nil 
  end
end