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
      @groups = @user.groups
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
  
  def update
    params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten 
    if @group.update_attributes(params[:group])
      redirect_to @group
      flash[:success] = "group updated"
    end
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = current_user.groups_as_owner.build(params[:group])
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
