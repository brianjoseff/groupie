require 'spec_helper'

describe UsersController, "show User" do
  @user ={
    :name => "Michael Hartl",
    :email => "mhartl@example.com",
    :password => "foobar",
    :id => 1
  }
  
  
  it "should be successful" do
    get :show, :id => @user
    response.should be_success
  end
end