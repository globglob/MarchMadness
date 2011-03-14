class UsersController < ApplicationController
  layout 'user'	
  def index
  	list
  	render('list')
  end	
  
  def list
  	@users = User.order("users.first_name ASC")
  end
  
  def show
  	@user = User.find(params[:id])
  end
  
  def new
	@user = User.new
  end
  
  def create
	#instantiate new object
	@user = User.new(params[:user])
	#save
	if @user.save
	  #success, redirect to list
	  flash[:notice] = "Owner created."
	  redirect_to(:action => 'list')
    else
	  #fails, redisplay form
	  render('new')
	end
  end
  
  def edit
  	@user = User.find(params[:id])
  end
  
  def update
	#find object
	@user = User.find(params[:id])
	#update
	if @user.update_attributes(params[:user])
	  #success, redirect to list
	  flash[:notice] = "Owner updated."
	  redirect_to(:action => 'show', :id => @user.id)
    else
	  #fails, redisplay form
	  render('edit')
	end
  end
  
  def delete
  	@user = User.find(params[:id])
  end
 
  def destroy
  	User.find(params[:id]).destroy
  	flash[:notice] = "Owner deleted."
  	redirect_to(:action => 'list')
  end
end
