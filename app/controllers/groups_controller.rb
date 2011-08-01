class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end
  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @groups = @user.groups
    else 
      @groups = Group.all
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to @group
    else
      redirect_to user_show(current_user)
    end
  end
end
