class CentersController < ApplicationController
  respond_to :html, :xml, :only => :show

def index
    @centers = Center.search(params[:search], params[:within]).paginate(:per_page => 2, :page => params[:page])
end

def follow
  
  if current_user
    @center = Center.find params[:id]
    user_followed_centers = Wrapper.where(:user_id => current_user.id, :following => true)
    unless  user_followed_centers.include? @center
      wrapper = Wrapper.create(:center_id => @center.id, :user_id => current_user.id, :following => true)
      wrapper.save!
    end 
    redirect_to({:action => :index}, {:notice => "You are now following #{@center.name} successfully"})
  else
    redirect_to new_user_session_path
  end
end


  def confirm_enrollment_1
    @center_id = params[:id]
  end
  
  def confirm_enrollment_2
    if current_user
      @evidence = Evidence.create(:media => params[:evidence])
      @wrapper = Wrapper.create(:user_id => current_user.id, :center_id => params[:center_id], :enrolled => true)
      @wrapper.save!
      @evidence.wrapper_id = @wrapper.id
      @evidence.save!
    else
      redirect_to new_user_session_path

    end
    
   redirect_to({:action => :index}, {:notice => "You have successfully confirmed your enrollment"})

  end

  def find_ambassador
    if current_user
      @center = Center.find params[:id]
      user_requested_centers = Wrapper.where(:user_id => current_user.id, :requested => true)
      unless  user_requested_centers.include? @center
        wrapper = Wrapper.create(:center_id => @center.id, :user_id => current_user.id, :requested => true)
        wrapper.save!
      end 
      redirect_to({:action => :index}, {:notice => "You will be contacted by one of #{@center.name}'s ambassadors in two business days!"})
    else
      redirect_to new_user_session_path
    end   
  end
 
  def show
    @center = Center.find(params[:id])
    respond_with @center
  end


  def new
    @center = Center.new
  end


  def edit
    @center = Center.find(params[:id])
  end

 
  def create
    @center = Center.new(params[:center])
      if @center.save
        redirect_to(@center, :notice => 'Center was successfully created.')      
      else
        render :action => "new" 
      end
  end


  def update
    @center = Center.find(params[:id])
    if @center.update_attributes(params[:center])
      redirect_to(@center, :notice => 'Center was successfully updated.') 
    else
      render :action => "edit" 
    end
  end


  def destroy
    @center = Center.find(params[:id])
    @center.destroy
    redirect_to(centers_url) 
  end
  
end
