require 'spec_helper' 

describe Center do 
  
  it "has a valid factory" do
     FactoryGirl.create(:center).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:center, name: nil).should_not be_valid 
  end
  
  it "is invalid without an address" do
    FactoryGirl.build(:center, address: nil).should_not be_valid
  end
  
  it "takes user's input of the zipcode and miles into consideration" do
    center_1 = FactoryGirl.create(:center, name: "Building Kids San Mateo", address: "San Mateo CA") 
    center_2 = FactoryGirl.create(:center, name: "Building Kids Sunnyvale", address: "Sunnyvale CA")
    
    Center.search("94403", 5).should ==  [center_1]
    Center.search("94403", 5).should_not include center_2
  end
  
end 

describe User, "references" do
  it "has a many to many relationship with users" do 
     have_and_belong_to_many(:users) 
  end 
end 