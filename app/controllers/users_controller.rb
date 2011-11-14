class UsersController < ApplicationController
  skip_before_filter :require_login, :only => :create
  before_filter :get_user, :except => [:index, :create, :new]
  before_filter :authorize, :except => [:create, :new, :show]
  
  #disparity between group id stored in membership and actual gorup id
  def show
    @public_groups = Group.public
    @groups_member = @user.groups_as_member
    @groups_as_owner = @user.groups_as_owner
    
    @random_items = @user.get_randos(@groups_member)
  end
  
  def edit
    unless current_user == @user
      deny_access(flash_message= "sorry, you can only edit your own stuff")
    end
  end
  
  def update
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
      GroupMailer.weekly_newsletter(@user).deliver
      sign_in @user
      redirect_to @user, :success => "Welcome to groupie"
    else
      #@title = "Sign up"
      render 'new'
    end
  end
  
  private
  def get_user
    @user = User.find(params[:id])
  end
  def authorize
    unless current_user == @user
      redirect_to current_user, :flash => {:notice => "Sorry, you can only view your own stuff"}
    end
  end
end
