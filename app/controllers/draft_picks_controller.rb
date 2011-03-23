class DraftPicksController < ApplicationController
  layout 'user'
  def index
  	list
  	render('list')
  end	
  
  def list
  	@draft_picks = DraftPick.find(:all, :include => :user, :include => :team,:order =>"draft_order ASC")
  end
  
  def show
  	@draft_pick = DraftPick.find(params[:id])
  end
  
  def new
	@draft_pick = DraftPick.new
	@users = User.order('first_name ASC')
	@teams = Team.order('name ASC')
  end
  
  def create
	#instantiate new object
	@draft_pick = DraftPick.new(params[:draft_pick])
	#save
	if @draft_pick.save
	  #success, redirect to list
	  flash[:notice] = "Pick created."
	  redirect_to(:action => 'list')
    else
	  #fails, redisplay form
	  @users = User.order('first_name ASC')
	  @teams = Team.order('name ASC')
	  render('new')
	end
  end
  
  def edit
  	@draft_pick = DraftPick.find(params[:id])
  	@users = User.order('first_name ASC')
    @teams = Team.order('name ASC')
  end
  
  def update
	#find object
	@draft_pick = DraftPick.find(params[:id])
	#update
	if @draft_pick.update_attributes(params[:draft_pick])
	  #success, redirect to list
	  flash[:notice] = "Pick updated."
	  redirect_to(:action => 'show', :id => @draft_pick.id)
    else
	  #fails, redisplay form
	  @users = User.order('first_name ASC')
	  @teams = Team.order('name ASC')
	  render('edit')
	end
  end
  
  def delete
  	@draft_pick = DraftPick.find(params[:id])
  end
 
  def destroy
  	DraftPick.find(params[:id]).destroy
  	flash[:notice] = "Pick deleted."
  	redirect_to(:action => 'list')
  end
end
