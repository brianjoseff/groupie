class GroupsController < ApplicationController
  before_filter :get_group, :except => [:index, :create, :new]
  def show
    @title = @group.name
    @posts = @group.posts
    @memberships = Membership.find_all_by_group_id(@group)
  end
  
  def index
    @title = "Groups"
    if params[:user_id]
      @user = User.find(params[:user_id])
      @groups = @user.groups_as_owner
    else 
      @search = Group.search do
        fulltext params[:search]
      end
      @groups = @search.results
    end
  end
  
  def edit
    @user = @group.owner
    unless current_user == @user
      redirect_to current_user, :flash => {:notice => "Sorry, you can only view your own stuff"}
    end
  end
  
  #this is updating the password field when users type it in. you need to figure out how
  #to just check their input against what code is on record for the group
  # use 'update_attribute()' or make a new controller action
  def update
    if params[:group_password] == @group.group_password
      params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten
      #special method update_attribute only updates explicitly stated attribute
      if @group.update_attribute(params[:group][:member_ids])
        redirect_to @group
        flash[:success] = "group updated"
      end
    else
      flash[:error] = "you need the secret password to join this group" 
      redirect_to @group
    end
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups_as_owner.build(params[:group])
      params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten 
    if @group.save
      redirect_to @group
    else
      redirect_to user_show(current_user)
    end
  end
  
  def destroy
    @group.destroy
  end
  
  # GET /groups/search
  def search
  @groups = Group.search params[:q]

  render :action => "index"
  end
  
  private
  def get_group
    @group = Group.find(params[:id])
  end
end
