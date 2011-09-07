class UsersController < ApplicationController
  skip_before_filter :require_login, :only => :create
  
  #disparity between group id stored in membership and actual gorup id
  def show
    @user = User.find(params[:id])
    @public_groups = Group.public
    @groups_member = @user.groups_as_member
  end
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      deny_access(flash_message= "sorry, you can only edit your own stuff")
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def new
    @user = User.new
    render :template => 'shared/signup'
  end
  
  def create
    @user = User.new(params[:user])
    
    #integrate with 'clearance' gem
    if @user.save
      sign_in @user
      redirect_to @user, :success => "Welcome to groupie"
    else
      #@title = "Sign up"
      render 'new'
    end
  end
  
  private
  def belongs_to_current_user
    unless current_user == @user
      deny_access(flash_message= "sorry, you can only edit your own stuff")
    end
  end
end
