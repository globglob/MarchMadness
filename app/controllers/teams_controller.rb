class TeamsController < ApplicationController
	
  def index
  	list
  	render('list')
  end	
  
  def list
  	@teams = Team.order("teams.seed ASC")
  end
  
  def show
  	@team = Team.find(params[:id])
  end
  
  def new
	@team = Team.new
  end
  
  def create
	#instantiate new object
	@team = Team.new(params[:team])
	#save
	if @team.save
	  #success, redirect to list
	  flash[:notice] = "Team created."
	  redirect_to(:action => 'list')
    else
	  #fails, redisplay form
	  render('new')
	end
  end
  
  def edit
  	@team = Team.find(params[:id])
  end
  
  def update
	#find object
	@team = Team.find(params[:id])
	#update
	if @team.update_attributes(params[:team])
	  #success, redirect to list
	  flash[:notice] = "Team updated."
	  redirect_to(:action => 'show', :id => @team.id)
    else
	  #fails, redisplay form
	  render('edit')
	end
  end
  
  def delete
  	@team = Team.find(params[:id])
  end
 
  def destroy
  	Team.find(params[:id]).destroy
  	flash[:notice] = "Team deleted."
  	redirect_to(:action => 'list')
  end
end
