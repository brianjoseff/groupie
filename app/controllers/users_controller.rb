class UsersController < ApplicationController
  skip_before_filter :require_login, :only => :create
  before_filter :get_user, :except => [ :create, :new, :check_email]
  before_filter :authorize, :except => [:create, :new, :show]
  
  
  #disparity between group id stored in membership and actual gorup id
  def show
    @public_groups_of_interest = Array.new
    unless @user.school.nil?
      @search = Group.search do
        fulltext @user.school
      end
      unless @search.results.nil?
        @public_groups_of_interst << @search.results
      end
    end
    @groups_member = @user.groups_as_member
    @groups_as_owner = @user.groups_as_owner
    @groups = @groups_as_owner + @groups_member
    @random_items = @user.get_randos(@groups)
    @categories = ProductCategory.all
  end
  
  def edit
    @header = "Edit"
    unless current_user == @user
      deny_access(flash_message= "sorry, you can only edit your own stuff")
    end
  end
  
  def update
    @header = "Edit"
    if @user.update_attributes(params[:user])
      if params[:stripe_customer_token]
        @user.update_stripe
        if @user.payment(@user)
          redirect_to @user, :notice => "Thanks dawg"
        else
          render :new
        end
      end
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
    rescue Stripe::InvalidRequestError => e
      logger.error e.message
      @user.errors.add :base, "There was a problem with your credit card"
      @user.stripe_token = nil
      render :action => :new
  end
  
  def new
    @user = User.new
    @header = "Sign up"
    render :template => 'shared/signup'
  end
  
  def create
    @header = "Sign up"
    @user = User.new(params[:user])
    
    
    #integrate with 'clearance' gem
    if @user.save
      UserMailer.welcome_mail(@user).deliver
      sign_in @user
      redirect_back_or @user
    else
      #@title = "Sign up"
      render 'new'
    end
    rescue Stripe::InvalidRequestError => e
      logger.error e.message
      @user.errors.add :base, "There was a problem with your credit card"
      @user.stripe_token = nil
      render :action => :new
  end
  def check_email
    @user = User.find_by_email(params[:user][:email])
    respond_to do |format|
      format.json { render :json => !@user}
    end
  end
  
  private
  def get_user
    @user = User.find(params[:id])
  end
  def authorize
    unless current_user == @user
      deny_access
      redirect_to current_user, :flash => {:notice => "Sorry, you can only view your own stuff"}
    end
  end
end
