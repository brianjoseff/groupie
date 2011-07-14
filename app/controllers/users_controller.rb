class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    #integrate with 'clearance' gem
    if @user.save
      sign_in @user
      redirect_to @user, :flash => { :success => "Welcome to pazego" }
    else
      #@title = "Sign up"
      render 'new'
    end
  end
end
