require 'spec_helper' 
describe CentersController do 
  describe "GET index" do 
    
    it "gets all centers" do
      center = FactoryGirl.create(:center) 
      get :index 
      assigns(:centers).should eq([center])
    end
    
    it "renders the index view" do
      get :index 
      response.should render_template :index
   
    end 
  end
  
  describe "GET find_ambassador" do 

    it "will not allow finding ambassadors if you ae not signed in" do
      center = FactoryGirl.create(:center) 
      get :find_ambassador 
      response.should redirect_to :new_user_session
    end
    
    it "allows finding an ambassador if you are signed in" do
      center = FactoryGirl.create(:center) 
      user = FactoryGirl.create(:user) 
      sign_in user
      get :find_ambassador, :id => center.id
      response.should redirect_to "/centers"   
    end 
  end  
  
  
  
  describe "GET show" do 
    it "gets the requested center" do
      center = FactoryGirl.create(:center) 
      get :show, id: center
      assigns(:center).should eq(center) 
    end
    
    it "renders the :show template of the requested center" do
      get :show, id: FactoryGirl.create(:center) 
      response.should render_template :show 
    end
    
   end 
  describe "GET new" do 
    it "assigns a new Center to @center" do
    end
    it "renders the :new template" do
    end
  end 
  describe "POST create" do 
    context "valid" do 
      it "saves the new center" do
        expect{ post :create, center: FactoryGirl.attributes_for(:center) }.to change(Center,:count).by(1) 
      end
      it "redirects to center show" do
        post :create, center: FactoryGirl.attributes_for(:center) 
        response.should redirect_to Center.last 
      end
    end 
     
    context "invalid" do 
      it "does not save the center" do 
        expect{ post :create, center: FactoryGirl.attributes_for(:invalid_center) }.to_not change(Center,:count)  
      end
      it "renders the new template" do
        post :create, center: FactoryGirl.attributes_for(:invalid_center) 
        response.should render_template :new 
      end
 
    end 
  end 
  
  describe 'PUT update' do 
    before :each do 
      @center  = FactoryGirl.create(:center, name: "Name", address: "Address") 
    end 
    context "valid attributes" do 
      it "located the requested center" do
         put :update, id: @center, center: FactoryGirl.attributes_for(:center) 
         assigns(:center).should eq(@center) 
      end 
      it "changes attributes" do 
        put :update, id: @center, center: FactoryGirl.attributes_for(:center, name: "Name", address: "Address") 
        @center.reload 
        @center.name.should eq("Name") 
        @center.address.should eq("Address") 
      end 
      it "redirects to the updated record" do 
        put :update, id: @center, contact: FactoryGirl.attributes_for(:center) 
        response.should redirect_to @center 
      end 
    end 
    context "invalid attributes" do 
      it "locates the requested @center" do 
        put :update, id: @center, center: FactoryGirl.attributes_for(:invalid_center) 
        assigns(:center).should eq(@center) 
       end 
      it "does not change attributes" do
         put :update, id: @center, center: FactoryGirl.attributes_for(:center, name: "C Name", address: nil) 
         @center.reload 
         @center.name.should_not eq("C Name") 
         @center.address.should eq("Address") 
       end 
       it "re-renders the edit method" do 
         put :update, id: @center, center: FactoryGirl.attributes_for(:invalid_center) 
         response.should render_template :edit 
       end 
     end 
  end 
  
  
end