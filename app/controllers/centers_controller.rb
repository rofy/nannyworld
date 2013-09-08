class CentersController < ApplicationController


def index
  if params[:search].present?
    @centers = Center.near( params[:search].to_region, params[:within], :order => :distance)
  else
   @centers = Center.all
  end
end

def follow
  
  if current_user
    @center = Center.find params[:id]
    unless current_user.centers.include? @center
      current_user.centers << @center
    end 
    redirect_to({:action => :index}, {:notice => "You are now following #{@center.name} successfully"})
  else
    redirect_to new_user_session_path
  end
end
 
  def show
    @center = Center.find(params[:id])
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
