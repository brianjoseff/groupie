class UsersController < ApplicationController
  skip_before_filter :require_login, :only => :create
  
  def new
    @user = User.new
    render :template => 'shared/signup'
  end
  
  def create
    @user = User.new(params[:user])
    
    #integrate with 'clearance' gem
    if @user.save
      sign_in @user
      redirect_to @user, :success => "Welcome to pazego"
    else
      #@title = "Sign up"
      render 'new'
    end
  end
end
